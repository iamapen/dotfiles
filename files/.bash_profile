
# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi


PATH=${HOME}/bin:$PATH

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
