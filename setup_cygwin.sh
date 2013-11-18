#!/bin/bash -e

BASE_DIR=$(cd $(dirname $0);pwd)

source setup.sh

FILES=$(find . -mindepth 1 -maxdepth 1 -name *_cygwin -exec basename {} \;)
FILES=$(echo $FILES | sed -e "s/ setup.sh//")
FILES=$(echo $FILES | sed -e "s/ setup_cygwin.sh//")
FILES=$(echo $FILES | sed -e "s/ [a-zA-Z0-9._]\+\.swp//g")


for FILE in $FILES
do
    LINKNAME=$(echo $FILE | sed -e "s/_cygwin$//")
	echo link "$HOME/$LINKNAME-> $BASE_DIR/$FILE"
	ln -sfT "$BASE_DIR/$FILE" "$HOME/$LINKNAME"
done
