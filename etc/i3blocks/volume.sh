#!/bin/bash

# Make sure wpctl is available
if ! command -v wpctl &> /dev/null; then
    exit 1
fi

# Get volume and mute status
# Output of wpctl is usually "Volume: 0.45 [MUTED]" or just "Volume: 0.45"
VOL_RAW=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$VOL_RAW" | awk '{printf "%.0f", $2 * 100}')
MUTED=$(echo "$VOL_RAW" | grep -o "\[MUTED\]")

# Logic for Icons and Colors
if [ -n "$MUTED" ]; then
    ICON="󰝟"        # Muted Icon
    COLOR="#ff5555" # Red
    DISPLAY="Muted"
else
    DISPLAY="${VOLUME}%"
    if [ "$VOLUME" -eq 0 ]; then
        ICON="󰝟"    # Muted/Zero Icon
        COLOR="#666666"
    elif [ "$VOLUME" -lt 40 ]; then
        ICON=""    # Volume Low
        COLOR="#f1fa8c" # Yellowish
    else
        ICON=""    # Volume High
        COLOR="#bd93f9" # Purple
    fi
fi

# i3blocks Output
echo "$ICON $DISPLAY" # Line 1: Full Text
echo "$ICON"          # Line 2: Short Text
echo "$COLOR"         # Line 3: Color

# Handle Click
if [[ "$BLOCK_BUTTON" -eq 1 ]]; then
    swaymsg exec "foot -a wiremix_float wiremix"
fi
