#!/bin/bash
# lets have date printed in beginning
date
# this will search your /etc/hosts
grep -i $1 /etc/hosts | awk -F\  '{print $2}' | while read output
do
if [[ -z $output ]]; then echo "is what you are looking for in /etc/hosts?"; exit 1
else
ping -c 1 -i 0.2 -W 1.5  "$output" > /dev/null 
fi
if [ $? -eq 0 ]; then
echo "node $output is up" 
else
echo "node $output is down"
fi
done
