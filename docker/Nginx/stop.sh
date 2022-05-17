#!/bin/bash

read CONIAINER_NAME < ./config/name

# 具体执行命令 start
docker stop --time=120 $CONIAINER_NAME
# 具体执行命令 end

./pause