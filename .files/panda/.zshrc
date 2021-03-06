# Path to your oh-my-zsh installation.
export ZSH=/Users/koki/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jira sublime bower npm osx brew gulp grunt noreallyjustfuckingstopalready docker)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#Android
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/"
export ANDROID_HOME="/Users/koki/development/android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#PATH
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

source $ZSH/oh-my-zsh.sh

source ~/.zshenv

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Init z
. ~/bin/z.sh


#Init Virtualenv
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

#run pip without Virtualenv
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development
source /usr/local/bin/virtualenvwrapper.sh


#Init the Fuck
eval $(thefuck --alias)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#JIRA
JIRA_NAME='nroos'


# Alias
alias grep='grep --color=auto'
colorflag='-G'
alias ls='command ls ${colorflag}'
alias l='ls -lah ${colorflag}'
alias ll='ls -l ${colorflag}'
alias la='ls -A ${colorflag}'
alias lsd='ls -lF ${colorflag} | grep "^d"'

alias p='python -m SimpleHTTPServer'
alias dev='cd ~/development'

# Git
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'

# System
alias x='htop'
alias y='top -o cpu'

# Mongodb
alias mongostart="launchctl start org.mongodb.mongod"
alias mongostop="launchctl stop org.mongodb.mongod"


# Functions


unkey_host() {
   if [[ -z "$1" ]] ; then
      echo "usage: \e[1;36munkey_host \e[1;0m< host >"
      echo "       Removes the specified host from ssh known host list"
   else
      sed -i -e "/$1/d" $HOME/.ssh/known_hosts
   fi
}


# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
# [[ -f /Users/koki/.nvm/versions/node/v5.9.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh ]] && . /Users/koki/.nvm/versions/node/v5.9.0/lib/node_modules/yo/node_modules/tabtab/.completions/yo.zsh
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export PATH="$HOME/.yarn/bin:$PATH"
