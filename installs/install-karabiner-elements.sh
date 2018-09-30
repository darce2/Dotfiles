#!/bin/bash

mkdir -p ~/tmp
brew install boost
brew install cmake
git git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git
cd Karabiner-Elements
make
