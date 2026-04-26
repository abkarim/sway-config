#!/bin/bash

# Get CPU idle percentage and handle potential comma/period issues
# We use awk to grab the value and convert it to an integer immediately
IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | LC_ALL=C awk '{print int($1)}')

# Calculate usage
CPU_USAGE=$((100 - IDLE))

# Line 1: Icon + Full text
echo "${CPU_USAGE}%"

# Line 2: Short text
echo "${CPU_USAGE}%"

# Line 3: Color logic
if [ "$CPU_USAGE" -gt 80 ]; then
    echo "#ff5555" # Red
elif [ "$CPU_USAGE" -gt 50 ]; then
    echo "#f1fa8c" # Yellow
else
    echo "#50fa7b" # Green
fi
