#!/usr/bin/env bash

set -e

DIRECTORY=$(cd $1 && pwd)
DIST=$DIRECTORY
RESOURCES=$DIRECTORY/../../../../resources/svg

echo "Compiling icons..."

for FILE in $DIST/*; do
    sed -e 's/ class="[^\"]*"//g' -e '/<path stroke="none" d="M0 0h24v24H0z" fill="none"\/>/d' -e '/^$/d' $FILE > $RESOURCES/$(echo ${FILE##*/})
done

echo "All done!"
