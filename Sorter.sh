#!/bin/bash
set -x

for f in *.mp3  #for all mp3 files in workingdirectory where f is name of file
do

    ARTIST=$(ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$f") #Define ARTIST as output of ffprobe grabbing Artist-Metadata
    echo "$f","$ARTIST"
    if [ -n "$ARTIST" ] #if Artist is not empty after previous command
    then
        echo "$f","$ARTIST"
        mkdir -p ../"$ARTIST"
        cp -n "$f" ../"$ARTIST"    #copy unless exists at destination
    else
        echo "$f","No Artist listed"
    fi
done
