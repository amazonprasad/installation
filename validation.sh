#!/bin/bash
date=$(date +%F)
USERID=$(id -u)
scriptname=$0
logfile=/tmp/$scriptname-$date.log

validate(){
    if [ $1 -ne 0 ]
    then 
        echo " $2.... failure"
        exit 1
    else   
        echo " $2 .... success"
    fi
}
if [ $USERID -ne 0 ]
then 
    echo "ERROR: Your not the root user"
    exit 1
else
    echo " Your are the root user"
fi

yum install mysql -y &>>$logfile

validate $? "mysql installation"
 yum install postfix -y &>>$logfile

validate $? "postfix installation"