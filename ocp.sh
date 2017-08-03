#!/bin/bash
date
grep -i $1 /etc/hosts | awk -F\  '{print $2}' | while read output
do
    ping -c 1 -i 0.2 -W 1.5  "$output" > /dev/null 
    if [ $? -eq 0 ]; then
    echo "node $output is up" 
    else
    echo "node $output is down"
    fi
done
