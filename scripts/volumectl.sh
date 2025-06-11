#!/usr/bin/env bash

# Modify volume
case $1 in
    "up") wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+ ;;
    "down") wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- ;;
    "mute") wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *) 
        echo "Invalid argument"
        exit 1 ;;
esac


# Get volume information
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
VOL="${VOL#*.}"

STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')


# Closes all displayed notifications and sends a new one
dunstctl close-all
case $1 in
    "up") notify-send -h int:value:$VOL "󰝝 Volume" ;; 
    "down") notify-send -h int:value:$VOL "󰝞 Volume" ;; 
    "mute") 
        if [ "$STATUS" = "[MUTED]" ]; then
            notify-send -h int:value:$VOL "󰖁 Volume MUTED"
        else
            notify-send -h int:value:$VOL "󰕾 Volume"
        fi ;;
esac
