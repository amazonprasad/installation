#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
validate(){
    if [ $1 -ne 0 ]
    then 
        echo " $2.... failure"
        exit 1
    else   
        echo " $2 .... success"
    fi
}
then 
    echo "ERROR: Your not the root user"
    exit 1
else
    echo " Your are the root user"
fi

yum install mysql -y 

validate $? "mysql installation"
 yum install postfix -y 

validate $? "postfix installation"