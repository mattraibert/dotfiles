# If not running interactively, exit
case $- in
    *i*) ;;
      *) return;;
esac

# export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

stty dsusp undef
export EDITOR="emacs -nw -Q"

export HISTSIZE="SUPERSIZE"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function open_by_browser(){
    open -a $1 $2
}
alias firefox='open_by_browser firefox'
alias chrome='open_by_browser "Google Chrome"'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
HISTIGNORE='&:[bf]g:jobs:%1:%2:ls:ll:la:l:tree:git st:cd ..:cd /:cd:pwd:c:clear:exit'

if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

alias ec="emacsclient -a '' -n"

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
LIGHT_BLUE="\033[1;34m"
CYAN="\033[0;36m"
NO_COLOR="\033[0m"

function parse_git_branch () {
   git status -b --porcelain 2> /dev/null | head -1 | sed -e 's/## //' -e 's/\.\.\.[^ ]*//' -e 's/\.\.\..* \[/ \[/'
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

function pw () {
cat ~/pw.txt | grep -i -A4 $@ | less
}

function dbyml () {
  cp ./config/database.sample.yml ./config/database.yml
  sed -i ''  "s/folio/$@/g" ./config/database.yml
}

export PS1="\[$GREEN\]\t\[$LIGHT_BLUE\]∙\[$NO_COLOR\]\h\[$LIGHT_BLUE\]∙\[$NO_COLOR\]\w\[$CYAN\]\$(git_initials)\[$NO_COLOR\]\[\$(parse_git_color)\]\$(parse_git_status)\[$NO_COLOR\]\n\$ "

export PATH=/usr/texbin:$PATH

export PATH=$HOME/.local/bin:$PATH

export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi

export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:$PATH
