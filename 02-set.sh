#!/bin/bash

#!/bin/bash

#!/bin/bash

#!/bin/bash
set -e
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script  #/home/ec2-user/shell-logs -> previous log files directory
LOG_FILE=$LOGS_DIR/$0.log # /home/ec2-user/shell-logs/logs.sh.log -> previous log files irectory
TIME_STAMP=$(date "+%y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo " error at $LINENO ", command : $BASH_COMMAND"' ERR
# check root access or not
if [ $USERID -ne 0 ]; then 
   echo " please run the script with root access "
   exit 1
fi

#VALIDATE(){
    #if [ $2 -ne 0 ]; then
        #echo  -e " $TIME_STAMP [ERROR]  Installing $1 ...... $R FAILED! $N " | tee -a $LOG_FILE  
        #exit 1
    #else
       # echo -e " $TIME_STAMP [INFO] Installing $1 ......$G SUCCEDED! $N" | tee -a $LOG_FILE
     #fi
#}

for package in $@
do 
    echo -e "$TIME_STAMP [INFO] Installing $package"
  dnf list installed $package &>> $LOG_FILE
  if [ $? -ne 0 ]; then
       dnf install $package -y  &>> $LOG_FILE
       #VALIDATE  "Installing $package" $?
  else
    echo -e " $TIME_STAMP [INFO] $package already installed ....$Y SKIPPING $N"

     fi
  
done
