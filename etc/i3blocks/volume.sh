#!/bin/bash

# Make sure wpctl is available
if [ -z "$(which wpctl)" ]; then
       exit 1
fi       

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%%\n", $2 * 100}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

echo "$volume $muted"
