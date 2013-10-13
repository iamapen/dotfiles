# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export PS1="[\[\033[40m\]\[\033[1;36m\]\t\[\033[0m\] \u@\h \W]$ "
export SVN_EDITOR=vim

umask 022

stty stop undef


# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
# alias less='less -r'                          # raw control characters
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -aF --color=auto'

# bash-completion
PREFIX=
BASH_COMPLETION=$PREFIX/etc/bash_completion
BASH_COMPLETION_DIR=$PREFIX/etc/bash_completion.d
BASH_COMPLETION_COMPAT_DIR=$PREFIX/etc/bash_completion.d
COMP_CONFIGURE_HINTS=1
MYBC=/home/pen/etc/bash_completion.d
if [ -f $BASH_COMPLETION ]; then
    source $BASH_COMPLETION
    source $MYBC/*
fi

