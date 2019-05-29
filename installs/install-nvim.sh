#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then

    # Install neovim and python support dependencies.
    brew install neovim
    brew install python
    brew install python3
    pip2 install --user neovim
    pip3 install --user neovim
    sudo gem install neovim
  else
    echo "still no desktop"
  fi


mkdir -p ~/.config/nvim
ln -sf ~/Dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/config/ ~/.config/nvim/config
ln -sf ~/Dotfiles/config/plugin_settings/coc-settings.json \
  ~/.config/nvim/coc-settings.json
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
