#!/bin/bash

# Check if nmcli exists
if ! command -v nmcli &> /dev/null; then
    echo "nmcli not found"
    exit 1
fi

# Get the first connected ethernet device
eth_info=$(nmcli -t -f DEVICE,TYPE,STATE device status | grep ':ethernet:connected$' | head -n1)

# Exit if no connected ethernet found
if [ -z "$eth_info" ]; then
    exit 0
fi

# Extract device name
device=$(echo "$eth_info" | cut -d: -f1)

# Get IPv4 address of the device
ip=$(ip -4 addr show dev "$device" | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n1)

# Print device and IP
echo "$device ($ip)"

