#!/usr/bin/env bash

DEVICE="intel_backlight"

case $1 in
    "up") brightnessctl set +10% ;;
    "down") brightnessctl set 10%-;;
    *) 
        echo "Invalid argument" 
        exit 1 ;;
esac

BRIGHTNESS=$(brightnessctl --device=$DEVICE get)
MAX=$(brightnessctl --device=$DEVICE max)
PERCENT=$(( 100 * $BRIGHTNESS / $MAX ))

notify-send -h int:value:$PERCENT "󰃠 Brightness"
