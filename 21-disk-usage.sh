#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=10
SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4) # this link is taken from google search => how i get server ip in aws ec2 curl command metadata

while IFS= read -r line
do

   USAGE=$( echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$( echo $line | awk '{print $7}')
   if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
       MESSAGE+="HIGH DISK USAGE ON $PARTITION: $USAGE <br>" # we can use + symbol in order to avoid the replacement of the message, if + is not used means then in evry loop the output lines will get replaced 
       #echo $line
   fi   

done <<< "$DISK_USAGE"
 
 echo  -e "$MESSAGE" # -e is used to enable special characters

 sh mail.sh "Devops Team" "High Disk Usage" "$SERVER_IP" "$MESSAGE" "lokam.nithisha@gmail.com" "High Disk Usage Alert"