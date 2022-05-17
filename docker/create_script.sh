#!/bin/bash
CURPATH=`pwd`
# NAME 文件名 CONIAINER_NAME 容器名 DATA_DIRECTORY 数据文件名
NAME=$1
CONIAINER_NAME=$2
DATA_DIRECTORY=$3
ERROR_MSG=null

echo "Run the script based on the template build container script"
echo "NAME is $NAME, CONIAINER_NAME is $CONIAINER_NAME, DATA_DIRECTORY is $DATA_DIRECTORY"

if [ -z $NAME ]; then
    echo "please enter directory of container script:"
	read NAME
fi

if [ -z $CONIAINER_NAME ]; then
    echo "please enter container name:"
	read CONIAINER_NAME
fi

if [ -z $DATA_DIRECTORY ]; then
    echo "please enter directory of container store data:"
	read DATA_DIRECTORY
fi

echo "NAME is $NAME, CONIAINER_NAME is $CONIAINER_NAME, DATA_DIRECTORY is $DATA_DIRECTORY"


if [ -z $NAME ]; then
    echo "Directory of container script not be null"
    exit
fi

if [ -z $CONIAINER_NAME ]; then
    echo "Container name not be null"
	exit
fi

if [ -z $DATA_DIRECTORY ]; then
    echo "Directory of container store data not be null"
	exit
fi

NAME_PATH=$CURPATH/$NAME
[ -e $NAME_PATH ] && echo "Directory of container script already exist" && exit

# 具体执行命令 start
mkdir $NAME_PATH
cp -r ./template/* "./$NAME"
echo $CONIAINER_NAME > "$NAME_PATH/config/name"
echo $DATA_DIRECTORY > "$NAME_PATH/config/data_directory"
echo "/$DATA_DIRECTORY" > "$NAME_PATH/.gitignore"
echo "success"
# 具体执行命令 end

./pause