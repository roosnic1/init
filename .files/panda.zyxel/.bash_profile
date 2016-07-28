#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"

export ANDROID_HOME="/Users/koki/development/android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/bin:/usr/local/cellar:/usr/local/share/python:$PATH
export PATH=/Applications/XAMPP/xamppfiles/bin:$PATH
export PATH=${PATH}:~/bin

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
# don't store duplicates in the history file.
# See bash(1) for more options
HISTCONTROL=ignoreboth:ignoredups:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000000


#PROMPT
#export PS1="\[\033[00;36m\]\u\[\033[00;31m\]@\h\[\033[00;32m\]!\[\033[00;36m\]\w: \[\033[00;32m\]"
### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	BLACK="\033[01;30m"
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="☮ "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

#LSCOLORS
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


#ALIAS
alias grep='grep --color=auto'

colorflag='-G'
alias ls='command ls ${colorflag}'
alias l='ls -lah ${colorflag}'
alias ll='ls -l ${colorflag}'
alias la='ls -A ${colorflag}'
alias lsd='ls -lF ${colorflag} | grep "^d"'

alias s='open -a "Sublime Text"'

alias dev='cd ~/development'
alias c='pygmentize -O style=monokai -f console256 -g'
alias x='top -o cpu'

# Git
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'

. ~/bin/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="/Users/koki/.nvm"
export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
export NVM_IOJS_ORG_MIRROR=http://iojs.org/dist
source $(brew --prefix nvm)/nvm.sh
eval $(thefuck --alias)
