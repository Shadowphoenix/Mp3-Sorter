#!/bin/bash
read -p "Enter the sourcedirectory : " SEARCHDIR
echo Searchdirectory is "$SEARCHDIR"

read -p "Enter the targetdirectory : " TARGETDIR
echo Targetdirectory is "$TARGETDIR"

cd "$SEARCHDIR"

for f in *.mp3  #for all mp3 files in workingdirectory where f is name of file
do

    ARTIST=$(ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$f") #Define ARTIST as output of ffprobe grabbing Artist-Metadata
    if [ -n "$ARTIST" ] #if Artist is not empty after previous command
    then
        mkdir -p "$TARGETDIR"/"$ARTIST"      #make dir unless exists at destination
        cp -n "$f" "$TARGETDIR"/"$ARTIST"    #copy unless exists at destination
        echo "$ARTIST","$f", copied to "$TARGETDIR"/"$ARTIST"
    else
        echo "$f","No Artist listed"
    fi
done
