#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  echo "Installing for OSX"

  brew install zsh zsh-completions
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ln -sf ~/Dotfiles/.zshrc ~/.

else
  echo "Installing for Arch"

  sudo pacman -S zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  ln -sf ~/Dotfiles/.zshrc ~/.
  chsh -s /bin/zsh
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

