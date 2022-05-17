#!/bin/bash
CURPATH=`pwd`

read CONIAINER_NAME < ./config/name
read DATA_DIRECTORY < ./config/data_directory

DATA_PATH="$CURPATH/$DATA_DIRECTORY"

[ -e $DATA_PATH ] || mkdir $DATA_PATH

# 具体执行命令 start
# docker run --name $CONIAINER_NAME -d -p 80:80 -v $DATA_PATH:/tmp/log docker/getting-started
# 具体执行命令 end

./pause