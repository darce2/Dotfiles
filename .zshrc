# Remove the username from the prompt and suppress Oh My Zsh's context segment.
export DEFAULT_USER="$USER"
prompt_context() {}

# Initialize Homebrew on Apple Silicon and Intel Macs.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

export PATH="$HOME/Dotfiles/functions:$HOME/Applications:$PATH"
export GEM_HOME="$HOME/.gem"
if command -v ruby >/dev/null 2>&1; then
  export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# fnm is installed by Homebrew on macOS and in ~/.local/share on Arch Linux.
for fnm_dir in "$HOME/.local/share/fnm" "$HOME/.fnm"; do
  if [[ -d "$fnm_dir" ]]; then
    export PATH="$fnm_dir:$PATH"
    break
  fi
done
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# uv installs user tools here.
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
HISTFILE="$HOME/.histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -v

COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  npm
  tmux
  yarn
  history
)

if [[ "$(uname -s)" == "Darwin" ]]; then
  plugins+=(macos)
else
  export SUDO_EDITOR=nvim
  plugins+=(archlinux python systemd)

  if [[ -z "$DISPLAY" && "$(tty 2>/dev/null)" == "/dev/tty1" ]] && command -v sway >/dev/null 2>&1; then
    XKB_DEFAULT_LAYOUT=us exec sway
  fi
fi

# Keep syntax highlighting last so it can wrap the key bindings from other plugins.
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"
bindkey '^k' autosuggest-accept

if [[ -f "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi
