MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
    MEM_USED=$(free -m | awk 'NR==2{print $3}')
    # Use bc for floating-point calculation
    MEM_USAGE_PERCENT=$(bc <<< "scale=2; 100 * $MEM_USED / $MEM_TOTAL")
    echo "$MEM_USAGE_PERCENT%"
    echo "$MEM_USAGE_PERCENT%"
    if [ "$MEM_USAGE_PERCENT" -gt 85 ]; then
    echo "#ff5555" # Red (Heavy load)
elif [ "$MEM_USAGE_PERCENT" -gt 60 ]; then
    echo "#f1fa8c" # Yellow (Medium load)
else
    echo "#50fa7b" # Green (Healthy)
fi
