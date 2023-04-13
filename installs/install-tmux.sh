#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install tmux
else
  echo "I stil dont have a desktop"
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf

