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

echo "$ssid ($signal%)"
