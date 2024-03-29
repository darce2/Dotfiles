# Remove username from prompt
export DEFAULT_USER=$USER`prompt_context(){}`

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/Dotfiles/functions

# Add ruby 
export PATH=$PATH:$(ruby -e 'puts Gem.user_dir')/bin
export GEM_HOME="$HOME/.gem"

# add terraform on optum laptop
export PATH=$PATH:/Users/adarcy1/bin

# direnv set up
eval "$(direnv hook zsh)"

# fnm manage node versions
export PATH=/home/arlen/.fnm:$PATH
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

if [ $(uname -s) = 'Darwin' ]; then
  # OSX:brew If you need to have ruby first in your PATH, run:
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  
  ## Divvy specific
  export PATH=$PATH:/Users/adarcy1/.pyenv/shims/python
  export PATH=$HOME/.local/bin:$PATH
  alias make=mmake
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
  export WORKON_HOME=$HOME/.virtualenvs
  pyenv virtualenvwrapper_lazy
  export PIPENV_VENV_IN_PROJECT=1
  export PIPENV_IGNORE_VIRTUALENVS=1
  ## end divvy

  # OSX:brew For compilers to find ruby you may need to set:
  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"

  # OSX:brew For pkg-config to find ruby you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

  # Add Applications folder
  export PATH=$PATH:/Users/arlen/Applications

  # Path to your oh-my-zsh installation.
  export ZSH="/Users/${USER}/.oh-my-zsh"

  autoload -Uz compinit
  compinit
  plugins=(
    git
    macos
    npm
    tmux
    yarn
    zsh-autosuggestions
    history
  )
else
  # Add Applications folder
  export PATH=$PATH:/home/arlen/Applications

  # Path to your oh-my-zsh installation.
  export ZSH="/home/${USER}/.oh-my-zsh"
  # End of lines configured by zsh-newuser-install
  # The following lines were added by compinstall
  zstyle :compinstall filename '/home/arlen/.zshrc'

  autoload -Uz compinit
  compinit
  # End of lines added by compinstall
  #
  export SUDO_EDITOR=nvim
  plugins=(
    git
    archlinux
    npm
    python
    systemd
    tmux
    yarn
    zsh-syntax-highlighting
    history
  )

  ## launch sway on login, not sure if need to keep variable
  if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
          XKB_DEFAULT_LAYOUT=us exec sway
  fi
fi
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -v

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

