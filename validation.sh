#!/bin/bash
date=$(date +%F)
USERID=$(id -u)
scriptname=$0
logfile=/tmp/$scriptname-$date.log
r="\e[30m"
g="\e[31m"
n="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
        echo " $2.... $r failure $n"
        exit 1
    else   
        echo " $2 .... $g success $n"
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