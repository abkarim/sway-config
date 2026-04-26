#!/bin/bash

# Get raw numbers in MB
MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
MEM_USED=$(free -m | awk 'NR==2{print $3}')

# Calculate whole number percentage for the 'if' logic
# (Multiplying by 100 first avoids needing bc for simple integer math)
PERCENT=$(( 100 * $MEM_USED / $MEM_TOTAL ))

# Calculate decimal version ONLY for the display (optional)
MEM_USAGE_DISPLAY=$(bc <<< "scale=1; 100 * $MEM_USED / $MEM_TOTAL")

# Line 1: Icon + Decimal Display
echo "${MEM_USAGE_DISPLAY}%"

# Line 2: Short Text
echo "${PERCENT}%"

# Line 3: Color Logic (Now works because $PERCENT is an integer)
if [ "$PERCENT" -gt 85 ]; then
    echo "#ff5555" # Red
elif [ "$PERCENT" -gt 60 ]; then
    echo "#f1fa8c" # Yellow
else
    echo "#50fa7b" # Green
fi
