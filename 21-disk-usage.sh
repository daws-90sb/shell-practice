#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=10

while IFS= read -r line
do

   USAGE=$( echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$( echo $line | awk '{print $7}')
   if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
       MESSAGE+="HIGH DISK USAGE ON $PARTITION: $USAGE" # we can use + symbol in order to avoid the replav=cement of the message, if + is not used means then in evry loop the output lines will get replaced 
       echo $line
   fi   

done <<< "$DISK_USAGE"
 
 echo "$MESSAGE"