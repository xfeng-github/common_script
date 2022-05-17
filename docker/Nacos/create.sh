#!/bin/bash
CURPATH=`pwd`

read CONIAINER_NAME < ./config/name
read DATA_DIRECTORY < ./config/data_directory

DATA_PATH="$CURPATH/$DATA_DIRECTORY"

[ -e $DATA_PATH ] || mkdir $DATA_PATH

# 具体执行命令 start
docker run --name $CONIAINER_NAME -d -p 8848:8848 -e MODE=standalone nacos/nacos-server:2.0.2
# 具体执行命令 end

./pause