#!/bin/bash

# 1. Get usage percentage and strip the '%' so it's just a number (e.g., 35)
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Line 1: Icon + Human readable used space + Percentage
echo "(${DISK_PERCENT}%)"

# Line 2: Short Text
echo "${DISK_PERCENT}%"

# Line 3: Color Logic (Now works because $DISK_PERCENT is an integer)
if [ "$DISK_PERCENT" -gt 85 ]; then 
    echo "#ff5555" # Red
elif [ "$DISK_PERCENT" -gt 60 ]; then 
    echo "#f1fa8c" # Yellow
else 
    echo "#50fa7b" # Green
fi
