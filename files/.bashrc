# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#export PS1='[\[\033[40m\]\[\033[1;36m\]\t\[\033[0m\] \u@\h \W]$ '
#export PS1='[\[\033[1;36m\]\t\[\033[0m\] \u@\h \W]$ '
#export PS1='[\[\033[36m\]\t\[\033[00m\] \u@\h \W]$ '

# Gitのブランチと変更数を表示。重い。
#export PS1='[\[\033[36m\]\t\[\033[00m\] \u@\h \W]$ \[\033[32m\]$(if git status &>/dev/null;then echo git[$(git branch | cut -d" "  -f2-) change:$(git status -s |wc -l)];fi)\[\033[00m\] '

# 失敗したら時計を紫に
export PS1='[\[\033[$(if [ "$?" != "0" ];then echo "35"; else echo "36"; fi)m\]\t\[\033[00m\] \u@\h \W]$ '

# オペログ取得用
#export PS1='[\t \u@\h \W]$ '



umask 0022

stty stop undef

# User specific aliases and functions
alias sudo='sudo -E '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#alias less='less -r'                         # raw control characters
#alias less='less -M -R'                      # raw control characters
#alias less='less -MRSi'                      # raw control characters
alias lv='lv -c'                              # raw control characters
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -aF --color=auto'
alias crontab='crontab -i'
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi
if [ -d "${HOME}/etc/opt_aliases" ] ; then
    for f in "${HOME}"/etc/opt_aliases/*_sh ; do
        [ -x "$f" ] && source "$f"
    done
    unset f
fi


# bash-completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi
#source ~/etc/bash_completion.d/*

# dircolors
if type -P dircolors >/dev/null; then
  eval `dircolors $HOME/.dir_colors`
fi

# man
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Ctrl+D を1回無視。オペミスによるログアウト防止のため。
export IGNOREEOF=1

# ヒストリ
export HISTSIZE=500
# 重複コマンド、先頭がスペースのコマンドは残さない
export HISTCONTROL=ignoreboth

# git
export GIT_SSH=/usr/bin/ssh

# php
export COMPOSER_HOME=~/.composer

