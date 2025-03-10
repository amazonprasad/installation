 #!/bin/bash
 DATE=$(date +%F)
 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 N="\e[30m"
 LOGFILE=/tmp/$0.log
 VALIDATE(){
    if [ $1 -ne 0 ];
    then 
        echo -e " Installing $2...$R is failure $N"
        exit 1
    else
        echo -e " $G Installing $2... is success $N"
    fi
 }
if [ $USERID -ne 0 ]
then 
    echo -e " $R Error: Your not the root user $N"
    exit 1
else 
    echo -e " $G Your are the root user $N"
fi 

for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo -e "$R $i is not installed, let us install now $N"
        yum install $i -y  &>>$LOGFILE
        VALIDATE $? "$i"
    else 
        echo -e " $G $i is already installed $N"
    fi 
done
