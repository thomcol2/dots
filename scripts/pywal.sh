#!/usr/bin/bash
# Used in dmenu_images

# Load colors from cache
xrdb ~/.cache/wal/colors.Xresources

# Restart programs
pkill -1 dwm
dwmblocks &

pidof firefox && pywalfox update

dunstctl reload ~/.cache/wal/dunstrc.rasi
