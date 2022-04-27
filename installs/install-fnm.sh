# https://github.com/Schniz/fnm

if [ $(uname -s) = 'Darwin' ]; then
  brew install fnm
else
  curl -fsSL https://fnm.vercel.app/install | bash
fi
