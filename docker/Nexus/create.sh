#!/bin/bash

CURPATH=`pwd`
DATA_PATH="$CURPATH/nexus-data"
[ -e $DATA_PATH ] || mkdir $DATA_PATH 


# 具体执行命令 start
docker run -d -p 8081:8081 -v $DATA_PATH:/nexus-data --name nexus sonatype/nexus3 
# 具体执行命令 end

./pause