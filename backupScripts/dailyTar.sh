#!/bin/bash

TARGET=$1 #Full path
DEST=$2 #Relativ path

if [ -d "$TARGET" ]; then
	cd $TARGET
	cd ..
	if [ ! -d "$DEST" ]; then

	  	mkdir -p $DEST
	fi

	DOW=$(date +%u)

	tar czfv $DEST/weekDay_${DOW}.tar.gz $TARGET
fi