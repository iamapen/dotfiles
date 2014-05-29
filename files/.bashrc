# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#export PS1="[\[\033[40m\]\[\033[1;36m\]\t\[\033[0m\] \u@\h \W]$ "
export PS1="[\[\033[1;36m\]\t\[\033[0m\] \u@\h \W]$ "
export SVN_EDITOR=vim
export EDITOR=vim

umask 0022

stty stop undef

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias less='less -r'                          # raw control characters
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -aF --color=auto'

export LC_MESSAGES=C
export LC_TIME=C

# bash-completion
source /etc/bash_completion
#source ~/etc/bash_completion.d/*

# for cygwin
uname | grep -i cygwin > /dev/null 2>&1
if [ $? -eq 0 ]; then
  source ~/.bashrc_cyg
fi
