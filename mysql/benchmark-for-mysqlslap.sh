#!/bin/bash
# 本脚本基于链接（https://blog.csdn.net/weixin_42272246/article/details/123183385）编写


# 设置MySQL连接参数
HOST=127.0.0.1
PORT=3306
USER_NAME=root
PASS_WORD=

if [ -z $HOST ]; then
	echo "please enter connnect host:"
	read HOST
fi

if [ -z $PORT ]; then
	echo "please enter connnect port:"
	read PORT
fi

if [ -z $USER_NAME ]; then
	echo "please enter username:"
	read USER_NAME
fi

if [ -z $PASS_WORD ]; then
	echo "please enter password:"
	read PASS_WORD
fi

echo "conncet to $HOST:$PORT, username: $USER_NAME ..."

# 设置基准测试参数
# create-schema 测试的database
DB=test_db
# --engines 要测试的引擎，可以有多个，用分隔符隔开，如--engines=myisam,innodb
ENGINES=innodb,memory,myisam
# --concurrency 并发数量,多个可以用逗号隔开
CONCURRENCY=10,20,25,30,35,40
# --iterations 要运行这些测试多少次
ITERATIONS=20
# --number-of-queries 总共要运行多少次查询。每个客户运行的查询数量可以用查询总数/并发数来计算
NUMBER_OF_QUERIES=10000
# --query 自己的SQL脚本执行测试
# --only-print 如果只想打印看看SQL语句是什么，可以用这个选项
# --auto-generate-sql 用系统自己生成的SQL脚本来测试
# --auto-generate-sql-load-type 
# 要测试的是读还是写还是两者混合的（read,write,update,mixed）
AUTO_GENERATE_SQL_LOAD_TYPE=read,write,update,mixed
# --number-int-cols 创建测试表的int型字段数量
NUMBER_INT_COLS=10
# --number-char-cols 创建测试表的chat型字段数量
NUMBER_CHAR_COLS=10
# --commit 每X条语句提交一次记录。
COMMIT=5
# --detach 在X次请求后分离(关闭并重新打开)连接。  
DETACH=100


echo "benchmark exec running info --create-schema=$DB --engine=$ENGINES --concurrency=$CONCURRENCY --iterations=$ITERATIONS --number-of-queries=$NUMBER_OF_QUERIES --auto-generate-sql-load-type=$AUTO_GENERATE_SQL_LOAD_TYPE --number-int-cols=$NUMBER_INT_COLS --number-char-cols=$NUMBER_CHAR_COLS --commit=$COMMIT --detach=$DETACH"
mysqlslap -h$HOST -P$PORT -u$USER_NAME -p$PASS_WORD --create-schema=$DB --engine=$ENGINES --concurrency=$CONCURRENCY --iterations=$ITERATIONS --number-of-queries=$NUMBER_OF_QUERIES --auto-generate-sql-load-type=$AUTO_GENERATE_SQL_LOAD_TYPE --number-int-cols=$NUMBER_INT_COLS --number-char-cols=$NUMBER_CHAR_COLS --commit=$COMMIT --detach=$DETACH --auto-generate-sql --auto-generate-sql-add-autoincrement 

./pause
