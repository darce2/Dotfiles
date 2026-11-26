# Dotfiles

Personal macOS and Arch Linux setup. Run the installer from a terminal with GitHub SSH access configured:

```sh
if [ ! -d "$HOME/Dotfiles/.git" ]; then git clone git@github.com:darce2/Dotfiles.git "$HOME/Dotfiles"; fi && "$HOME/Dotfiles/install.sh"
```

The installer installs Homebrew and the packages in `Brewfile` on macOS, or the supported packages with `pacman` on Arch Linux. It links the Zsh, tmux, Kitty, and Neovim configs, installs Oh My Zsh plugins and tmux plugins, and bootstraps the language servers listed in `nvim/lua/config/lsp.lua`. Existing files that need replacing are moved to timestamped backups, and rerunning `install.sh` is safe.

On macOS it also imports the iTerm2 preferences on first setup, installs Hammerspoon, and installs the ShiftIt Spoon. Hammerspoon keeps these window shortcuts:

- `Ctrl+Option+Cmd+H`: left half
- `Ctrl+Option+Cmd+J`: lower half
- `Ctrl+Option+Cmd+K`: upper half
- `Ctrl+Option+Cmd+L`: right half

macOS requires manual approval for Hammerspoon Accessibility access. The install script prints that follow-up step.

Neovim requires version 0.12 or newer. Plugins are installed by `vim.pack` at the revisions in `nvim/nvim-pack-lock.json`; run `:lua vim.pack.update()` in Neovim to review plugin updates. Run `:DotfilesInstallServers` if you need to reinstall the configured language servers.
