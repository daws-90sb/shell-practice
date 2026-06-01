#!/bin/bash

SOURCE_DIR=$1
DAYS=${2:-14} # If $2 values is given then that values will be passed into days ex : $2= 5 is given means 5 days , else by default 14 days will be taken when no values is given into $2

if [ $# -lt 1 ]; then
    echo "ERROR :: Missing Parameters"
    echo "USAGE: $0 <SOURCE_DIR> [days(optional to default 14)]"
    exit 1
fi    

if [ ! -d $SOURCE_DIR ]; then
     echo "ERROR: Directory: $SOURCE_DIR does not exist"
     exit 1
fi     