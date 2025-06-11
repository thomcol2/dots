#!/usr/bin/env bash

# Wallpaper scripts
~/.fehbg
xrdb ~/.cache/wal/colors.Xresources

# Background scripts
dunst -conf ~/.cache/wal/dunstrc.rasi &
picom -b &
redshift -l 43:-88.4 -t 6500:3500 -m randr &
dwmblocks &
xss-lock -l -- slock &

exec dwm
