#!/bin/bash
TIMESTAMP=$(date +%F-%H:%M:%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
echo -e "script running staerted at $Y $TIMESTAMP $N"
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ....$R FAILED $N"
    else
        echo -e "$2 ....$G SUCCESS $N"
    fi
}
ID=$(id -u)
if [ $ID -ne 0 ]; then
    echo "you are not root user"
    exit 1
else
    echo "you are root user"
fi

sudo yum install mysql -y &>> $LOGFILE
$VALIDATE $? "mysql installation is"

# if [ $? -ne 0 ]; then   
#     echo "mysql iss not installed"
#     exit 2
# else
#     echo "mysql is installed"
# fi