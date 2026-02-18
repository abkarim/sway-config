MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
    MEM_USED=$(free -m | awk 'NR==2{print $3}')
    # Use bc for floating-point calculation
    MEM_USAGE_PERCENT=$(bc <<< "scale=2; 100 * $MEM_USED / $MEM_TOTAL")
    echo "$MEM_USAGE_PERCENT%"
