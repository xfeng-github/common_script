#!/bin/bash
CURPATH=`pwd`
DATA_PATH="$CURPATH/jenkins_home"

[ -e $DATA_PATH ] || mkdir $DATA_PATH

# 具体执行命令 start
docker run --name jenkins -p 8080:8080 -p 50000:50000 -v $DATA_PATH:/var/jenkins_home jenkins/jenkins:lts-jdk11
# 具体执行命令 end

./pause