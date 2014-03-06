RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
LIGHT_BLUE="\033[1;34m"
CYAN="\033[0;36m"
NO_COLOR="\033[0m"


function parse_git_branch () {
   git status -b --porcelain 2> /dev/null | head -1 | sed -e 's/## //' -e 's/\.\.\..* \[/ \[/'
}

function parse_git_color () {
  if [ -n "`git status --porcelain 2>&1 | grep "fatal: Not a git repository"`" ]
  then
    echo -e "$NO_COLOR"
  elif [ -z "`git status --porcelain 2> /dev/null`" ]
  then
    echo -e "$GREEN"
  elif [ -z "`git status --porcelain 2> /dev/null | grep -v -E "^[MARCD]  .*$"`" ]
  then
    echo -e "$YELLOW"
  else
    echo -e "$RED"
  fi
}

function parse_git_status () {
  if [ -n "`git status --porcelain 2>&1 | grep "fatal: Not a git repository"`" ]
  then
    echo -e ""
  elif [ -z "`git status --porcelain 2> /dev/null`" ]
  then
    echo -e "(`parse_git_branch`)"
  elif [ -z "`git status --porcelain 2> /dev/null | grep -v -E "^[MARCD]  .*$"`" ]
  then
    echo -e "{`parse_git_branch`}"
  else
    echo -e "<`parse_git_branch`>"
  fi
}

function git_initials () {
  if [ -n "`git status --porcelain 2>&1 | grep "fatal: Not a git repository"`" ]
  then
    echo -e ""
  else
    echo -e " `git config -l | grep user.initials | cut -d= -f2` "
  fi
}

export PS1="\[$GREEN\]\t\[$LIGHT_BLUE\]∙\[$NO_COLOR\]\h\[$LIGHT_BLUE\]∙\[$NO_COLOR\]\w\[$CYAN\]\$(git_initials)\[$NO_COLOR\]\[\$(parse_git_color)\]\$(parse_git_status)\[$NO_COLOR\]\$ "

export PATH=/usr/local/bin:~/bin:~/.bin:$PATH
source /etc/bash_completion.d/git

# Load RVM into a shell session *as a function*
   [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

alias ll="ls -al"
alias cleanemacs='rm .#* **/.#*'
export JAVA_HOME=/Library/Java/Home
export EDITOR=emacs

export HISTSIZE="SUPERSIZE"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
HISTIGNORE='&:[bf]g:jobs:%1:%2:ls:cd:pwd:c:clear:exit'

source ~/.aliases
