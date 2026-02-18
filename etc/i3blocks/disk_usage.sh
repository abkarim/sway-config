DISK_USAGE=$(df -h | awk '$NF=="/"{printf "%s", $5}')
    echo "$DISK_USAGE"
