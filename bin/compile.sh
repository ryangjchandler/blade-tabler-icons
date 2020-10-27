#!/usr/bin/env bash

set -e

DIRECTORY=$(cd `dirname $0` && pwd)
DIST=$DIRECTORY/../dist
RESOURCES=$DIRECTORY/../resources/svg

echo "Compiling icons..."

for FILE in $DIST/*; do
  cp $FILE $RESOURCES/$(echo ${FILE##*/})
done

echo "All done!"
