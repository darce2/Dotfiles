#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install zsh zsh-completions
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "I still don't have a desktop"
fi
