#!/usr/bin/env bash
# Used in dwm

wallpaper() {
FOLDER=~/wallpapers
SCRIPT=~/scripts/pywal.sh

CHOICE=$(nsxiv -o -t $FOLDER)
case $CHOICE in
    *.*)
        feh --bg-fill $CHOICE
        wal -i $CHOICE -n -o $SCRIPT ;;
    *) ;;
esac
}

case $(echo -e "Set wallpaper\nView file" | dmenu -c -i -l 2 -p "Image tool: ") in
    "Set wallpaper")
        wallpaper ;; 
    "View file") 
        DIR=$(echo -n "" | dmenu -c -p "File: ~/")
        nsxiv -t $DIR ;;
    *) ;;
esac
