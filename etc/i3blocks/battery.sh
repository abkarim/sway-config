#!/bin/bash

battery_path="/sys/class/power_supply/BAT0"

[ ! -d "$battery_path" ] && exit 

status=$(cat "$battery_path/status")
capacity=""

case "$status" in
	"Charging")    icon="(+a) " ;;
   	 "Discharging") icon="(-) " ;;
   	 "Full")        icon="(F) " ;;
esac

if [ -f "$battery_path/capacity" ]; then 
	capacity="$(cat "$battery_path/capacity")%"
fi

echo "$icon$capacity"
