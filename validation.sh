#!/bin/bash
date=$(date +%F)
USERID=$(id -u)
scriptname=$0
logfile=/tmp/$scriptname-$date.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $2.... $R failure $N"
        exit 1
    else   
        echo -e " $2 .... $G success $N"
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