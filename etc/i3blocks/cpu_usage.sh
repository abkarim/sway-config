IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
    CPU_USAGE=$((100 - IDLE))
    echo "$CPU_USAGE%"
