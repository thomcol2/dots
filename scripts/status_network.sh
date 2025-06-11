#!/usr/bin/bash
DEVICE='wlan0'

INFO=$(echo $((iwctl station $DEVICE show | grep 'Connected network') || echo "Disconnected"))

case $INFO in
    "Disconnected") echo "󰖪 Disconnected" ;;
    *) echo "󰖩 $(echo "$INFO" | cut -d' ' -f3-)" ;;
esac
