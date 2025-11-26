#!/bin/bash

battery_path="/sys/class/power_supply/BAT0"

[ ! -d "$battery_path" ] && exit 

status=$(cat "$battery_path/status")
capacity=""

if [ -d "$battery_path/capacity" ]; then 
	capacity="$(cat "$battery_path/capacity")%"
fi

echo "$status $capacity"
