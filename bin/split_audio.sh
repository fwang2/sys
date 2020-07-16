#!/bin/bash
if [ $# -ne 1 ]
then
    echo "provide a file name"
    exit 1
fi

spleeter separate -i $1  -p spleeter:2stems -o output

