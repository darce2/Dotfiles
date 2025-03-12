#!/bin/bash

# git clone https://github.com/powerline/fonts.git --depth=1
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1 ~/fonts
cd ~/fonts
./install.sh SourceCodePro
rm -rf ~/fonts
