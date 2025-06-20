#!/bin/bash

battery_path="/sys/class/power_supply/BAT0"

if [ ! -d "$battery_path" ]; then
	        exit
fi

status=$(cat "$battery_path/status")
capacity=$(cat "$battery_path/capacity")

echo "$status $capacity%"
