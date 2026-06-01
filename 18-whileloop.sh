#!/bin/bash

### while will take one one line into every single loop
while IFS= read -r line # IFS Internal Field Separator
do 

echo $line

done < 01-install.sh # while loop will access this file and takes the each line into loop on every turn 