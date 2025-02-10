#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "ERROR: Your not the root user"
else
    echo " Your are the root user"
fi

    yum install mysql -y 
    