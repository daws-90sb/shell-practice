#!/bin/bash

###  special variables  ###

echo " All variables passed to script : $@ "
echo " number of variables passed : $# "
echo " first variable : $1 "
echo " script name : $0 "
echo " who is running this script : $USER "
echo " working on which directory : $PWD "
echo " present user's home directory : $HOME "
echo " process instance id of the script :  $$ " 
# process instance id will get created every time while running the script
sleep 5 &

echo " process instance id of background running command just now : $! "