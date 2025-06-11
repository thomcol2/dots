#!/usr/bin/bash

DEVICE="BAT0"
CAPACITY=$(cat /sys/class/power_supply/$DEVICE/capacity)
STATUS=$(cat /sys/class/power_supply/$DEVICE/status)

case $STATUS in
    'Charging') echo "󰂄 $CAPACITY%" ;;
    'Full') echo "󰁹 $CAPACITY%" ;;
    'Discharging')
        if [ $CAPACITY -ge 75 ]; then
            echo "󰂀 $CAPACITY%"
        elif [ $CAPACITY -lt 25 ]; then
            echo "󰁻 $CAPACITY%"
            notify-send -u critical "Battery low" "$DEVICE is at $CAPACITY% charge"
        else
            echo "󰁾 $CAPACITY%"
        fi ;;
esac
