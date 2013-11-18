#!/bin/bash -e

BASE_DIR=$(cd $(dirname $0);pwd)
FILES=$(find . -mindepth 1 -maxdepth 1 -exec basename {} \;)
FILES=$(echo $FILES | sed -e "s/ setup.sh//")
FILES=$(echo $FILES | sed -e "s/ setup_cygwin.sh//")
FILES=$(echo $FILES | sed -e "s/ [a-zA-Z0-9._]\+_cygwin//g")
FILES=$(echo $FILES | sed -e "s/ [a-zA-Z0-9._]\+\.swp//g")

for FILE in $FILES
do
	echo link "$HOME/$FILE -> $BASE_DIR/$FILE"
	ln -sfT "$BASE_DIR/$FILE" "$HOME/$FILE"
done
