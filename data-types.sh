#!/bin/bash

NUM1=10
NUM2=20


SUM=$(($NUM1+$NUM2))
echo " sum is : $SUM "

# Array
movies=("OKADU" "VARANASI" "ATHADU") # index always starts from 0
echo " movies are : ${movies[@]} "
echo " first movie is : ${movies[0]} "
echo " second movie is : ${movies[1]} "
echo " third  movie is : ${movies[2]} "