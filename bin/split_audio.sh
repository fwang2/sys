#!/bin/bash
if [ $# -ne 1 ]
then
    echo "provide a file name"
    exit 1
fi

set -x

spleeter separate -i "$1"  -p spleeter:2stems -o output

if [ $? -eq 1 ]
then
   echo "error occured, exit 1"
fi


FILENAME=`basename "$1"`

# extract filename without ext
FILEBASE=`echo "$FILENAME" | cut -d'.' -f1`


ffmpeg -i "output/$FILEBASE/accompaniment.wav" "伴奏+$FILEBASE".mp3
