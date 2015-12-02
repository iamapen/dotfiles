
# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

if [ -d "${HOME}/.bash.d" ] ; then
    for f in "${HOME}"/.bash.d/*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# ENV
export LC_MESSAGES=C
export LC_TIME=C
export MANPAGER='less -R'
export MANPATH=/usr/share/man/ja:$MANPATH
export SVN_EDITOR=vim
export EDITOR=vim

# Ctrl+D を1回無視。オペミスによるログアウト防止のため。
export IGNOREEOF=1

# ヒストリ
export HISTSIZE=500
# 重複コマンド、先頭がスペースのコマンドは残さない
export HISTCONTROL=ignoreboth
# 日付も残す
HISTTIMEFORMAT='%Y-%m-%d %T '

# LESS
export LESS='-M -R'
#export LESS='-M -R --quit-if-one-screen'
if [[ -x `which src-hilite-lesspipe.sh` ]]; then
  LESSOPEN='| src-hilite-lesspipe.sh %s'
fi


## proxy ##
#USERNAME=
#PASSWORD=
#HOST=
#PORT=

#PROXY=$HOST:$PORT
#PROXY=$USERNAME:$PASSWORD@HOST:$PORT

#export http_proxy="http://$PROXY"
#export https_proxy="https://$PROXY"
#export ftp_proxy="ftp://$PROXY
#export no_proxy=127.0.0.1,localhost
#export HTTP_PROXY=$http_proxy
#export HTTPS_PROXY=$https_proxy
#export FTP_PROXY=$ftp_proxy
#export NO_PROXY=$no_proxy
