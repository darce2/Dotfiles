#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install the_silver_searcher
else
  pacman -S the_silver_searcher
fi

