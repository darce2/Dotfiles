# https://direnv.net/docs/installation.html

if [ $(uname -s) = 'Darwin' ]; then
  brew install direnv
else
  yay -S direnv
fi
