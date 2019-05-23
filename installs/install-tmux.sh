#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install tmux
else
  echo "I stil dont have a desktop"
fi
ln -sf ~/Dotfiles/.tmux.conf ~/.tmux.conf

