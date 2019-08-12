#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install node
  brew install yarn

  # for plugin for markdown
  npm install -g livedown
else
  echo "I stil dont have a desktop"
fi

