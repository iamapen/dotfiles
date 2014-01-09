#!/bin/bash -e

BASE_DIR=$(cd $(dirname $0);pwd)
RESOURCE_DIR="$BASE_DIR/files"

CYGWIN=false
case "$(uname)" in
  CYGWIN*) CYGWIN=true;;
esac

FILES=$(find $RESOURCE_DIR -mindepth 1 -maxdepth 1 -exec basename {} \;)
FILES=$(echo $FILES | sed -e "s/[a-zA-Z0-9._]\+_cygwin \?//g")

for FILE in $FILES
do
  echo -e
  echo link "$HOME/$FILE -> $RESOURCE_DIR/$FILE"
  ln -siT "$RESOURCE_DIR/$FILE" "$HOME/$FILE"
done


if [ $CYGWIN = true ]; then
FILES=$(find $RESOURCE_DIR -mindepth 1 -maxdepth 1 -type f -name *_cygwin -exec basename {} \;)
for FILE in $FILES
  do
    LINKNAME=$(echo $FILE | sed -e "s/_cygwin$//")
    echo -e
    echo link "$HOME/$LINKNAME-> $RESOURCE_DIR/$FILE"
    ln -siT "$RESOURCE_DIR/$FILE" "$HOME/$LINKNAME"
  done
fi
