#!/bin/bash

if [ $(uname -s) 'Darwin' ]; then
  brew install node
  brew install yarn
else
  echo "I stil donw have a desktop"
fi

