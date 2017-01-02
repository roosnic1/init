#!/bin/bash

TARGET=$1
MAIL=$2

CHANGES=$(find $TARGET -mtime -7 -ls)

if [ $? -ne 0 ]; then
    echo "$CHANGES" | /opt/bin/nail -s "FAIL: weeklychange failed" nicolas.k.roos@gmail.com
else
    echo "$CHANGES" | /opt/bin/nail -s "Weekly changes for ${TARGET}" $MAIL
fi