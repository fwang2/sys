#!/usr/bin/env bash
#


if [ $# -ne 2 ]
then
    echo "Usage:"
    echo "     pr c test.c"
    echo "     pr cpp test.cpp"
    echo "     pr java test.java"
    echo "     pr go test.go"
    echo "     pr sh test.sh"
    echo "     pr python test.py"
    echo "     pr txt sample.txt, no line number"
    echo "     pr txtn sample.txt, with line number"
    echo "     pr csh test.csh"
    echo "     pr bash test.sh"
    echo "     pr [f90|fpp] test.[f90|fpp]"
    echo 
    echo "The generated pdf is located at /tmp "
    echo
    exit 1
fi

FILE_EXT=$1

# It appears that -Epython is correct setting
#if [ $1 == "python" ]; then
#    FILE_EXT=py
#fi

if [ $1 == "fpp" ] || [ $1 == "f90" ]; then
    FILE_EXT=fortran
fi

FILE_BASE=`basename $2 .$1`

PLATFORM=`uname -s`
echo "EXT=$FILE_EXT, BASE=$FILE_BASE" 
# -C for line number
# -G for fancy header
# -Ejava for java format
# -p - send output to standard out

if [ $FILE_EXT == "txt" ]; then
    enscript -G -f Courier7 -p tmp.ps $2 
    open tmp.ps
    exit 0
fi

if [ $FILE_EXT == "txtn" ]; then
    # -C is for line number
    enscript -C -G -f Courier7 -p tmp.ps $2 
    open tmp.ps
    exit 0
fi


if [ $PLATFORM == "Linux" ]; then
    enscript -C -G -f Courier7 -E${FILE_EXT} -p tmp.ps $2
    ps2pdf tmp.ps /tmp/$FILE_BASE.pdf
    rm -f tmp.ps
else 
    # Darwin
    enscript -C -G -f Courier7 -E${FILE_EXT} -p tmp.ps $2 
    #pstopdf  tmp.ps -o /tmp/$FILE_BASE.pdf
    #rm -f tmp.ps
    open tmp.ps
    #open /tmp/$FILE_BASE.pdf
fi

# clean up

