#!/bin/bash

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts


# also download this https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/RobotoMono.zip
