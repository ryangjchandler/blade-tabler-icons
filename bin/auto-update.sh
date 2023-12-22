#!/usr/bin/env bash

set -e

repo_url="https://github.com/tabler/tabler-icons/archive/master.zip"
extract_dir="resources/svg/"
temp_zip="tabler-icons-master.zip"

echo "Downloading latest icons from $repo_url..."
curl -Ls "$repo_url" -o "$temp_zip"

if [ $? -eq 0 ]; then
    echo "Downloaded successfully. Extracting..."
    unzip -qqo "$temp_zip" -d "$extract_dir"
    mv "$extract_dir/tabler-icons-master/icons/"* "$extract_dir"
    rm -rf "$extract_dir/tabler-icons-master"
    rm "$temp_zip"
    echo "Cleaning up icon classes..."

    for FILE in "$extract_dir"/*; do
        if [ -f "$FILE" ]; then
            tmp_file=$(mktemp) || exit 1
            sed -e 's/ class="[^\"]*"//g' -e '/<path stroke="none" d="M0 0h24v24H0z" fill="none"\/>/d' -e '/^$/d' "$FILE" >"$tmp_file" && mv "$tmp_file" "$FILE"
        fi
    done
    echo "All done!"
else
    echo "Download failed. Please check the URL or your internet connection."
fi
