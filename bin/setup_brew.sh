#!/bin/bash

pkgs="ctags cmake corkscrew pkg-config wget opensc \
    valgrind enscript go"

for p in $pkgs 
do
    brew install $p
done

