#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
SCRIPT_LOG="$SCRIPT_DIR/Disk_Usage.log"

usage=$(df -hT /apps/ | awk 'NR == 2 {print int($4/$3*100)}')

if [[ $usage -gt 75 ]];
then
    echo "High /apps Mount Point Usage on $(hostname | cut -d "." -f1):$(hostname -i | cut -d" " -f1)"
    printf "$(date "+%Y-%m-%d %H:%M:%S")\t $usage \n" >> "$SCRIPT_LOG"
else 
    printf "$(date "+%Y-%m-%d %H:%M:%S")\t $usage \n" >> "$SCRIPT_LOG"
fi

