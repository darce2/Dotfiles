#!/bin/bash

if [ $(uname -s) = 'Darwin' ]; then
  brew install node
  brew install yarn
else
  echo "I stil dont have a desktop"
fi

