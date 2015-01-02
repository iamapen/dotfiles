#!/bin/bash

####
# screenで再接続した際に、SSH_AUTH_SOCK 環境変数を更新する
#
# Usage:
#   source $0
####


# 環境変数がなければ何もしない
if [ -e $SSH_AUTH_SOCK ]; then
  exit 0
fi

# 自分の作成したsocketを確認(転送されたagent)
KNOWN_SOCK=`find /tmp/ssh-* -maxdepth 1 -mindepth 1 -type s -user $USER | head -n1`

# 見つかった最初のsocketを再設定
export SSH_AUTH_SOCK=$KNOWN_SOCK
