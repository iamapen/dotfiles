#!/bin/bash -e

BASE_DIR=$(cd $(dirname $0);pwd)

# dotfiles
FILES=$(find . -mindepth 1 -maxdepth 1 -type f -exec basename {} \;)
FILES=$(echo $FILES | sed -e "s/setup.sh \?//")
FILES=$(echo $FILES | sed -e "s/setup_cygwin.sh \?//")
FILES=$(echo $FILES | sed -e "s/[a-zA-Z0-9._]\+_cygwin \?//g")
FILES=$(echo $FILES | sed -e "s/[a-zA-Z0-9._]\+\.swp \?//g")

for FILE in $FILES
do
  echo -e
  echo link "$HOME/$FILE -> $BASE_DIR/$FILE"
  ln -siT "$BASE_DIR/$FILE" "$HOME/$FILE"
done

# vimrc.d
echo -e
echo link "$HOME/.vimrc.d -> $BASE_DIR/.vimrc.d"
ln -siT "$BASE_DIR/.vimrc.d" "$HOME/.vimrc.d"

# bash-completion.d
echo -e
echo link "$HOME/etc/bash_completion.d -> $BASE_DIR/etc/bash_completion.d"
ln -siT "$BASE_DIR/etc/bash_completion.d" "$HOME/etc/bash_completion.d"
