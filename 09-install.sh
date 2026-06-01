#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then 
   echo " please run the script with root access "
   exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo " Installing $1 ...... FAILED!"
        exit 1
    else
        echo " Installing $1 ...... SUCCEDED! "
     fi
}

#echo "I'm continuing...."
  dnf list installed mysql

if [ $? -eq 0 ]; then
   echo " mysql already installed.....SKIPPING "

else
   echo "Installing mysql"
   dnf install mysql -y
   VALIDATE mysql $?
   
fi

#echo "I'm continuing...."
  dnf list installed nginx

if [ $? -eq 0 ]; then
   echo " nginx already installed.....SKIPPING "

else
   echo "Installing mysql"
   dnf install nginx -y
   VALIDATE nginx $?
   
fi