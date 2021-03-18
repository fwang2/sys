#!/bin/bash

# Download and keep mp4

PROG="youtube-dl \
    --no-mtime \
    -o ~/Movies/%(title)s.%(ext)s"

if [ $# -ne 1 ]
then
    echo "Usage:"
    echo "     youtube-mp4.sh URL"
    echo
    exit 1
fi

$PROG $1
