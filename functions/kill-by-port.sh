#! /bin/bash

for arg in "$@"
do
  kill $(lsof -t -i:$arg)
done

