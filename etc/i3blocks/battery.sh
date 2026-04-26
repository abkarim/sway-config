#!/bin/bash

# Get battery percent and status
PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STATUS" = "Charging" ]; then
    ICON="󰂄"
    COLOR="#f1fa8c" # Yellow
elif [ "$PERCENT" -lt 20 ]; then
    ICON=""
    COLOR="#ff5555" # Red
else
    ICON=""
    COLOR="#50fa7b" # Green
fi

echo "$ICON $PERCENT%"
echo "$ICON $PERCENT%"
echo "$COLOR"
