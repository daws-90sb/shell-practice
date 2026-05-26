#!/bin/bash

#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script  #/home/ec2-user/shell-logs -> previous log files directory
LOG_FILE=$LOGS_DIR/$0.log # /home/ec2-user/shell-logs/logs.sh.log -> previous log files irectory
TIME_STAMP=$(date "+%y-%m-%d %H:%M:%S")

# check root access or not
if [ $USERID -ne 0 ]; then 
   echo " please run the script with root access "
   exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo  " $TIME_STAMP [ERROR] " Installing $1 ...... FAILED!" | tee -a $LOG_FILE  
        exit 1
    else
        echo "$TIME_STAMP [INFO] Installing $1 ...... SUCCEDED! " | tee -a $LOG_FILE
     fi
}

for package in $@
do 
  echo " Installing ....$package "
  dnf list installed $package   &>> $LOG_FILE
  if [ $? -ne 0 ]; then
       dnf install $package -y  &>> $LOG_FILE
       VALIDATE  "Installing $package" $?
  else
    echo "$package already installed ....SKIPPING"

     fi
  
done
