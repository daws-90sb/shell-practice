#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then 
   echo " please run the script with root access "
   exit 1
fi

echo "I'm continuing...."

echo "Installing mysql"
dnf install mysql -y


if [ $? -ne 0 ]; then

echo " Installing mysql ...... FAILED!"
exit 1

else

echo " Installing mysql ...... SUCCEDED! "


 
