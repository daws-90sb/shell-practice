#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14} # If $2 values is given then that values will be passed into days ex : $2= 5 is given means 5 days , else by default 14 days will be taken when no values is given into $2

if [ -z $SOURCE_DIR ]; then
    echo "ERROR :: Missing Parameters"
    echo "USAGE: $0 <SOURCE_DIR> [days(optional to default 14)]"
    exit 1
fi    

if [ ! -d $SOURCE_DIR ]; then
     echo "ERROR: Directory: $SOURCE_DIR does not exist"
     exit 1
fi

echo "Scanning $SOURCE_DIR for log files older then 14 days"
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ -z "$FILES" ]; then
   echo "No log files older than 14 days found"
   exit 0
fi   

while IFS= read -r FILE
do
    echo "FILE to be deleted : $FILE"
    rm -f $FILE
    echo " File $FILE deleted "
done <<< "$FILES"

# < ---> INPUT Symbols
# > ---> OUTPUT Symbols
# <  -> for file
# <<<  -> variable (command output as input)