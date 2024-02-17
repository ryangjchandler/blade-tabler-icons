#!/usr/bin/env bash

set -e

repo="tabler/tabler-icons"
latest_release=$(curl -s https://api.github.com/repos/$repo/releases/latest)
version=$(echo "$latest_release" | grep '"tag_name":' | cut -d'"' -f4 | sed 's/^v//')
download_url=$(echo "$latest_release" | grep '"browser_download_url":' | cut -d'"' -f4)
zip_file_name="tabler-icons-$version"
destination="resources/svg"

echo "Downloading latest icons from https://github.com/$repo..."
curl -OLs "$download_url"

if [ $? -eq 0 ]; then
    echo "Downloaded successfully. Extracting..."
    unzip -qqo "$zip_file_name.zip" -d "$zip_file_name"

    mkdir -p $destination
    mv "$zip_file_name/svg"/* $destination

    rm -rf "$zip_file_name"
    rm "$zip_file_name.zip"

    echo "Cleaning up icon classes..."

    for FILE in "$destination"/*.svg; do
        if [ -f "$FILE" ]; then
            tmp_file=$(mktemp) || exit 1
            sed -e 's/ class="[^\"]*"//g' -e '/<path stroke="none" d="M0 0h24v24H0z" fill="none"\/>/d' -e '/^$/d' "$FILE" >"$tmp_file" && mv "$tmp_file" "$FILE"
        fi
    done
    echo "All done!"
else
    echo "Download failed. Please check the URL or your internet connection."
fi
