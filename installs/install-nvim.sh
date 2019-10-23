#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then

    echo "Installing for OSX\n"
    # Install neovim and python support dependencies.
    brew install neovim
    brew install python
    brew install python3
    pip2 install --user neovim
    pip3 install --user neovim
    sudo gem install neovim
    npm install -g neovim
  else
    echo "still no desktop"
  fi
else
    echo "Installing for Arch\n"
    sudo
    sudo pacman -Sy neovim
    sudo pacman -Sy python2-neovim python-neovim ruby nodejs npm
    gem install neovim
    sudo npm install -g neovim
fi


mkdir -p ~/.config/nvim
ln -sf ~/Dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/Dotfiles/config/ ~/.config/nvim/config
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
