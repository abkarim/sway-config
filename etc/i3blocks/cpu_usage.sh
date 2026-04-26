IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
    CPU_USAGE=$((100 - IDLE))
    echo "$CPU_USAGE%"
    echo "$CPU_USAGE%"

    if [ "$CPU_USAGE" -gt 80 ]; then
    echo "#ff5555" # Red for high usage
elif [ "$CPU_USAGE" -gt 50 ]; then
    echo "#f1fa8c" # Yellow for medium usage
else
    echo "#50fa7b" # Green for low usage (or use #ffffff for white)
fi
