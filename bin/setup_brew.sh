#!/bin/bash

pkgs="ctags cmake corkscrew pkg-config wget 
	opensc \
	openshift-cli \
	helm \
    	valgrind enscript go"

for p in $pkgs 
do
    brew install $p
done

