#!/bin/bash

# gt greater than
# lt less than
# ge greatethan or equal to
# le less than or equal to
# eq eual to
# ne not equal

NUMBER=$1
if [ $NUMBER -gt 10 ]; then
   echo " Given number $NUMBER is greater than 10 "
elif [ $NUMBER -eq 10 ]; then
   echo " given number $NUMBER is equal to 10 "   
else 
   echo " Given number $NUMBER is less than 10 "

fi 


