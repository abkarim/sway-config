#!/bin/bash

# Handle Click: Open the Manager
if [[ "$BLOCK_BUTTON" -eq 1 ]]; then
    swaymsg exec "foot -a bt_float bluetui"
fi

# Get Status
STATE=$(echo "show" | bluetoothctl | grep "Powered: yes" | wc -l)

if [ "$STATE" -eq 0 ]; then
    echo "Off"
else
    # Check for connected devices
    DEVICE=$(echo "info" | bluetoothctl | grep "Name:" | cut -d ' ' -f 2-)
    if [ -z "$DEVICE" ]; then
        echo "On"
    else
        echo "$DEVICE"
    fi
fi
