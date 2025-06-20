#!/bin/bash

if ! command -v nmcli &> /dev/null; then
	    echo "nmcli not found"
	        exit 1
fi

eth_info=$(nmcli -t -f DEVICE,TYPE,STATE device status | grep '^.*:ethernet:connected:' | head -n1)

if [ -z "$eth_info" ]; then
	        exit 0
fi

device=$(echo "$eth_info" | cut -d: -f1)
ip=$(ip -4 addr show dev "$device" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)

echo "$device ($ip)"
