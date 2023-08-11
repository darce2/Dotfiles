#!/bin/bash

# git clone https://github.com/powerline/fonts.git --depth=1
git clone https://github.com/ryanoasis/nerd-fonts.git
cd fonts
./install.sh
cd ..
rm -rf nerd-fonts
