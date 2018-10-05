#!/bin/bash

mkdir ~/tmp/kb
brew install boost
brew install cmake
git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git ~/tmp/kb
cd ~/tmp/kb
make
rm -rf ~/tmp
