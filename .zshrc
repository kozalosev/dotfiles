# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/kozalo/.oh-my-zsh

# Set name of the theme to load.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="koz-gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Make 'less' more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Parameters for the "tmux" plugin.
# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_FIXTERM=false
# ZSH_TMUX_AUTOCONNECT=false

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # Version Control Systems
  git
  git-extras
  gitfast
  # mercurial

  # Distributive specific
  debian
  # archlinux

  # Basic utilities
  autojump
  command-not-found
  colorize
  history
  last-working-dir
  sudo
  systemd
  perms

  # Additional utilities
  urltools
  jsontools
  web-search
  # tmux
  # ssh-agent
  # per-directory-history
  # catimg
  encode64

  # Plugins that are not from oh-my-zsh
  zsh-syntax-highlighting
  zsh-autosuggestions

  # Containers and virtualization
  docker
  docker-compose
  # vagrant

  # Other software
  # sublime
  redis-cli
  # jira


  ### Programming languages ###

  # Python
  python
  pip
  # pep8
  # pylint
  # django
  # supervisor

  # Java
  gradle
  mvn

  # PHP
  # composer

  # JavaScript
  # npm
  # bower

  # Scala
  # scala
  # sbt

  # Haskell
  # cabal
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes.
# For a full list of active aliases, run `alias`.

alias zshconfig="vim ~/.zshrc"

# Key bindings
bindkey '^ ' autosuggest-accept

# PATHs
source ~/.profile

# Aliases
source ~/.shell_aliases
