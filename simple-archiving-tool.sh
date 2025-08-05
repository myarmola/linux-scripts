#!/bin/bash

if [ ! -d "$1" ]; then
    echo "The directory was not specified or does not exist"
    exit 1
fi

archived_dir=$(basename "$1")
destination="$HOME/logs_archives" # Default destination for archives, can be changed
archive="$destination/${archived_dir}_logs_archive_$(date +"%F_%H-%M-%S").tar.gz"
mkdir -p "$destination"
tar czf "$archive" -C "$1" .

if [ $? -eq 0 ]; then
    echo "The archive $archive has been created successfully."
fi
