#!/bin/bash

if [ ! -d "$1" ]; then
    echo "The directory was not specified or does not exist" # To make sure the argument is a directory
    exit 1
fi
archive="$HOME/logs_archive_$(date +"%F_%H-%M-%S").tar.gz" # It's a default path, you may change to your own
tar czf "$archive" $1 
if [ $? -eq 0 ]; then
    echo "Please ignore the error above;)" # An error tar: Removing leading `/' from member names
    echo "The archive $archive has been created"
fi
