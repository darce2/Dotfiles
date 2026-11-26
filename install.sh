#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_HOME="${HOME:?HOME must be set}"
PLATFORM="$(uname -s)"

info() {
  printf '[dotfiles] %s\n' "$*"
}

warn() {
  printf '[dotfiles] WARNING: %s\n' "$*" >&2
}

fail() {
  printf '[dotfiles] ERROR: %s\n' "$*" >&2
  exit 1
}

on_error() {
  local status=$?
  local line="$1"
  local command="$2"
  printf '[dotfiles] ERROR: Command failed at line %s (exit %s): %s\n' \
    "$line" "$status" "$command" >&2
  exit "$status"
}

trap 'on_error "$LINENO" "$BASH_COMMAND"' ERR

backup_path() {
  local target="$1"
  local timestamp
  local backup
  local suffix=1

  timestamp="$(date +%Y%m%d-%H%M%S)"
  backup="$target.backup-$timestamp"
  while [[ -e "$backup" || -L "$backup" ]]; do
    backup="$target.backup-$timestamp-$suffix"
    suffix=$((suffix + 1))
  done
  mv "$target" "$backup"
  info "Moved existing $target to $backup"
}

link_path() {
  local source="$1"
  local destination="$2"

  [[ -e "$source" || -L "$source" ]] || fail "Missing source path: $source"
  mkdir -p "$(dirname "$destination")"

  if [[ -L "$destination" ]] && [[ "$(readlink "$destination")" == "$source" ]]; then
    info "Already linked: $destination"
    return
  fi

  if [[ -e "$destination" || -L "$destination" ]]; then
    backup_path "$destination"
  fi

  ln -s "$source" "$destination"
  info "Linked $destination -> $source"
}

ensure_git_checkout() {
  local remote="$1"
  local destination="$2"
  local required_file="${3:-}"

  if [[ -n "$required_file" && -f "$destination/$required_file" ]]; then
    return
  fi
  if [[ -d "$destination/.git" ]] && [[ -z "$required_file" ]]; then
    return
  fi
  if [[ -e "$destination" ]]; then
    backup_path "$destination"
  fi

  mkdir -p "$(dirname "$destination")"
  git clone --depth=1 "$remote" "$destination"

  if [[ -n "$required_file" && ! -f "$destination/$required_file" ]]; then
    fail "Checkout from $remote did not contain $required_file."
  fi
}

ensure_xcode_command_line_tools() {
  if xcode-select -p >/dev/null 2>&1; then
    return
  fi

  info "Requesting Apple's Command Line Tools."
  xcode-select --install >/dev/null 2>&1 || true
  local attempt
  for ((attempt = 1; attempt <= 90; attempt++)); do
    if xcode-select -p >/dev/null 2>&1; then
      return
    fi
    sleep 10
  done
  fail "Command Line Tools were not installed. Complete the macOS prompt and rerun this installer."
}

ensure_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    else
      ensure_xcode_command_line_tools
      info "Installing Homebrew."
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  fi

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  command -v brew >/dev/null 2>&1 || fail "Homebrew is not available on PATH."
}

install_macos_packages() {
  ensure_homebrew

  # Homebrew Bundle cannot adopt a manually installed app when its version
  # differs from the cask. Replace an unmanaged Kitty with the Brewfile version.
  if [[ -d /Applications/kitty.app ]] && ! brew list --cask --versions kitty >/dev/null 2>&1; then
    rm -rf /Applications/kitty.app
    info "Removed the unmanaged Kitty app before installing the Brewfile version."
  fi

  info "Installing macOS packages from Brewfile."
  brew bundle --file "$DOTFILES_DIR/Brewfile"
}

install_arch_packages() {
  [[ -r /etc/arch-release ]] || fail "Linux is supported only on Arch Linux."
  command -v sudo >/dev/null 2>&1 || fail "sudo is required to install Arch packages."

  local packages=(
    curl
    direnv
    git
    kitty
    neovim
    python
    ripgrep
    ruby
    the_silver_searcher
    tmux
    ttf-sourcecodepro-nerd
    uv
    unzip
    zsh
    zsh-completions
  )

  info "Installing Arch packages and applying the current system upgrade."
  sudo pacman -Syu --needed --noconfirm "${packages[@]}"
}

install_fnm_and_node() {
  local global_packages=()

  if ! command -v fnm >/dev/null 2>&1; then
    if [[ "$PLATFORM" == "Darwin" ]]; then
      fail "fnm was not installed by Homebrew."
    fi
    info "Installing fnm for Linux."
    curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
    if [[ -x "$TARGET_HOME/.local/share/fnm/fnm" ]]; then
      PATH="$TARGET_HOME/.local/share/fnm:$PATH"
      export PATH
    fi
  fi

  command -v fnm >/dev/null 2>&1 || fail "fnm installation did not produce an executable."
  eval "$(fnm env --shell bash)"
  fnm install --lts --use
  fnm default "$(fnm current)"
  eval "$(fnm env --shell bash)"

  command -v yarn >/dev/null 2>&1 || global_packages+=(yarn)
  command -v livedown >/dev/null 2>&1 || global_packages+=(livedown)
  if ((${#global_packages[@]} > 0)); then
    npm install --global "${global_packages[@]}"
  fi
}

install_oh_my_zsh() {
  local oh_my_zsh="$TARGET_HOME/.oh-my-zsh"
  local custom_plugins="$oh_my_zsh/custom/plugins"

  if [[ ! -f "$oh_my_zsh/oh-my-zsh.sh" ]]; then
    ensure_git_checkout https://github.com/ohmyzsh/ohmyzsh.git "$oh_my_zsh" oh-my-zsh.sh
  fi

  ensure_git_checkout \
    https://github.com/zsh-users/zsh-autosuggestions.git \
    "$custom_plugins/zsh-autosuggestions"
  ensure_git_checkout \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$custom_plugins/zsh-syntax-highlighting"
}

install_tmux_plugins() {
  local tpm="$TARGET_HOME/.tmux/plugins/tpm"
  ensure_git_checkout https://github.com/tmux-plugins/tpm "$tpm"
  [[ -x "$tpm/bin/install_plugins" ]] || fail "TPM install script is missing at $tpm."
  "$tpm/bin/install_plugins"
}

install_iterm2_preferences() {
  local preferences="$HOME/Library/Preferences/com.googlecode.iterm2.plist"
  local temporary_directory

  if defaults read com.googlecode.iterm2 >/dev/null 2>&1 || [[ -e "$preferences" ]]; then
    info "Keeping existing iTerm2 preferences."
    return
  fi

  temporary_directory="$(mktemp -d)"
  python3 - "$DOTFILES_DIR/iterm2/com.googlecode.iterm2.plist" \
    "$temporary_directory/com.googlecode.iterm2.plist" "$HOME" <<'PY'
import plistlib
import sys

source_path, destination_path, home = sys.argv[1:]
with open(source_path, "rb") as source:
    settings = plistlib.load(source)

for profile in settings.get("New Bookmarks", []):
    if profile.get("Working Directory") == "/Users/arlen":
        profile["Working Directory"] = home

with open(destination_path, "wb") as destination:
    plistlib.dump(settings, destination, fmt=plistlib.FMT_XML)
PY

  defaults import com.googlecode.iterm2 "$temporary_directory/com.googlecode.iterm2.plist"
  rm -rf "$temporary_directory"
  info "Imported the tracked iTerm2 preferences."
  [[ -e "$preferences" ]] || warn "iTerm2 preferences were imported but no preferences file was created yet."
}

install_hammerspoon() {
  local spoon_dir="$TARGET_HOME/.hammerspoon/Spoons/ShiftIt.spoon"
  local work_dir

  link_path "$DOTFILES_DIR/hammerspoon/init.lua" "$TARGET_HOME/.hammerspoon/init.lua"
  if [[ ! -d "$spoon_dir" ]]; then
    if [[ -e "$spoon_dir" || -L "$spoon_dir" ]]; then
      backup_path "$spoon_dir"
    fi
    work_dir="$(mktemp -d)"
    if ! curl -fsSL \
      https://github.com/peterklijn/hammerspoon-shiftit/raw/master/Spoons/ShiftIt.spoon.zip \
      -o "$work_dir/ShiftIt.spoon.zip"; then
      rm -rf "$work_dir"
      fail "Could not download the ShiftIt Spoon."
    fi
    if ! unzip -q "$work_dir/ShiftIt.spoon.zip" -d "$work_dir"; then
      rm -rf "$work_dir"
      fail "Could not unpack the ShiftIt Spoon archive."
    fi
    if [[ ! -d "$work_dir/ShiftIt.spoon" ]]; then
      rm -rf "$work_dir"
      fail "ShiftIt Spoon download was not a valid archive."
    fi
    mkdir -p "$(dirname "$spoon_dir")"
    mv "$work_dir/ShiftIt.spoon" "$spoon_dir"
    rm -rf "$work_dir"
  else
    info "Keeping the existing ShiftIt Spoon at $spoon_dir."
  fi
  open -a Hammerspoon
}

setup_links() {
  link_path "$DOTFILES_DIR/.zshrc" "$TARGET_HOME/.zshrc"
  link_path "$DOTFILES_DIR/.tmux.conf" "$TARGET_HOME/.tmux.conf"
  link_path "$DOTFILES_DIR/nvim" "$TARGET_HOME/.config/nvim"
  link_path "$DOTFILES_DIR/.config/kitty/kitty.conf" "$TARGET_HOME/.config/kitty/kitty.conf"
  mkdir -p "$TARGET_HOME/.undo"
}

set_default_shell() {
  if [[ "$PLATFORM" != "Linux" ]]; then
    return 0
  fi

  local zsh_path
  zsh_path="$(command -v zsh)"
  if [[ "$SHELL" == "$zsh_path" ]]; then
    return
  fi
  if [[ -t 0 ]]; then
    if ! chsh -s "$zsh_path"; then
      warn "Could not change the login shell automatically. Run: chsh -s $zsh_path"
    fi
  else
    warn "Login shell is not zsh. Run: chsh -s $zsh_path"
  fi
}

bootstrap_neovim() {
  local version_line
  version_line="$(nvim --version | head -n 1)"
  nvim --headless --clean -u NONE \
    -i NONE \
    -c 'lua assert(vim.fn.has("nvim-0.12") == 1, "Neovim 0.12+ is required")' \
    -c 'qa!'

  info "Bootstrapping Neovim plugins and language servers ($version_line)."
  nvim --headless -i NONE \
    -c 'lua local ok, err = pcall(vim.cmd, "DotfilesInstallServers"); if not ok then io.stderr:write("[dotfiles] " .. tostring(err) .. "\n"); vim.cmd("cquit 1") end' \
    -c 'qa!'
}

case "$PLATFORM" in
  Darwin)
    install_macos_packages
    ;;
  Linux)
    install_arch_packages
    ;;
  *)
    fail "Unsupported operating system: $PLATFORM"
    ;;
esac

install_fnm_and_node
install_oh_my_zsh
setup_links
install_tmux_plugins
set_default_shell

if [[ "$PLATFORM" == "Darwin" ]]; then
  install_iterm2_preferences
  install_hammerspoon
fi

bootstrap_neovim

info "Setup finished."
if [[ "$PLATFORM" == "Darwin" ]]; then
  cat <<'EOF'
macOS follow-up:
  - Grant Hammerspoon Accessibility access in System Settings > Privacy & Security > Accessibility.
  - Restart Hammerspoon after granting Accessibility access.
EOF
fi
