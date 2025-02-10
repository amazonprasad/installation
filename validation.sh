#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR: Your not the root user"
    exit 1
else
    echo " Your are the root user"
fi

yum install mysql -y 

if [ $? -ne o ]
then 
    echo " installation of mysql is error"
    exit 1
else
    echo " installation of mysql is success"
fi
