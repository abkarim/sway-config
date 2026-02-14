#!/bin/bash

# Check if nmcli exists
if ! command -v nmcli &> /dev/null; then
	    echo "nmcli not found"
	        exit 1
fi

# Get active Wi-Fi connection info
wifi_info=$(nmcli -t -f ACTIVE,SSID,SIGNAL device wifi list | grep '^yes' | head -n1)

if [ -z "$wifi_info" ]; then
	        exit 0
fi

# Parse info: format is ACTIVE:SSID:SIGNAL:BARS
IFS=':' read -r active ssid signal  <<< "$wifi_info"

# Get the Wi-Fi device name
device=$(nmcli -t -f DEVICE,TYPE,STATE device status | grep ':wifi:connected$' | cut -d: -f1 | head -n1)

# Get IPv4 address of the Wi-Fi device
ip=$(ip -4 addr show dev "$device" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)

# Print SSID, signal, and IP
echo "$ssid ($signal%) ($ip)"

# If left-clicked, open nmtui in a new terminal window
if [[ "$BLOCK_BUTTON" -eq 1 ]]; then
    swaymsg exec "foot -a nmtui_float nmtui"
fi
