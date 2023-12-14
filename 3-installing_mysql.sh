#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]; then
    echo "you are not root user"
    exit 1
else
    echo "you are root user"
fi

sudo yum install mysql -y

if [ $? -ne 0 ]; then   
    echo "mysql iss not installed"
    exit 2
else
    echo "mysql is installed"
fi