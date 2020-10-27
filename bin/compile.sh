#!/usr/bin/env bash

set -e

DIRECTORY=$(cd `dirname $0` && pwd)
DIST=$DIRECTORY/../dist
RESOURCES=$DIRECTORY/../resources/svg

echo "Compiling icons..."

for FILE in $DIST/*; do
    sed -e 's/ class="[^\"]*"//g' -e 's/ width="[^\"]*"//g' -e 's/ height="[^\"]*"//g' -e '/^$/d' $FILE > $RESOURCES/$(echo ${FILE##*/})
done

echo "All done!"
