#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

# to check whether the directory is empty or not #
if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
   echo "Either source directory or destination directory empty"
   echo "USAGE :: $0 [source_dir] [dest_dir] [days:default 14]"
   exit 1
fi

# to check whether the directory exist or not. if empty - false condition so ! # false*false
if [ ! -d $SOURCE_DIR ]; then
   echo "Source directory : $SOURCE_DIR does not exist"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
    echo "Destination directory : $DEST_DIR does not exist"
fi

FILES=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +$DAYS)

if [ -z "$FILES" ]; then 
   echo "Log files olderthan 14 days not found, nothing to do"
   exit 0
fi

# while IFS= read -r FILE
# do
#    echo "$FILE"

# done <<< "$FILES"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
ARCHIVE_FILE="$DEST_DIR/logs-archive-$TIMESTAMP.tar.gz"

tar -czvf $ARCHIVE_FILE $FILES 

if [ $? -eq 0 ]; then
   echo "Archieval is success, deleteing the files"
   while IFS= read -r FILE
   do
       rm -f $FILE
       echo "Delete file : $FILE"
    done <<< "$FILES"
else
    echo "ERROR :: Archieval is failed"
    exit 1
fi        


