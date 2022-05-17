@echo off
rem 本脚本基于链接（https://blog.csdn.net/weixin_42272246/article/details/123183385）编写


rem 设置MySQL连接参数
set HOST=127.0.0.1
set PORT=3306
set USER_NAME=root
set PASS_WORD=

if "%HOST%" == "" (
	echo "please enter connnect host:"
	SET /p HOST=
)

if "%PORT%" == "" (
	echo "please enter connnect port:"
	SET /p PORT=
)

if "%USER_NAME%" == "" (
	echo "please enter username:"
	SET /p USER_NAME=
)

if "%PASS_WORD%" == "" (
	echo "please enter password:"
	SET /p PASS_WORD=
)
echo conncet to %HOST%:%PORT%, username: %USER_NAME% ...

rem 设置基准测试参数
rem create-schema 测试的database
set DB=test_db
rem --engines 要测试的引擎，可以有多个，用分隔符隔开，如--engines=myisam,innodb
set ENGINES=innodb,myisam
rem --concurrency 并发数量,多个可以用逗号隔开
set CONCURRENCY=10,20,25,30,35,40
rem --iterations 要运行这些测试多少次
set ITERATIONS=20
rem --number-of-queries 总共要运行多少次查询。每个客户运行的查询数量可以用查询总数/并发数来计算
set NUMBER_OF_QUERIES=10000
rem --query 自己的SQL脚本执行测试
rem --only-print 如果只想打印看看SQL语句是什么，可以用这个选项
rem --auto-generate-sql 用系统自己生成的SQL脚本来测试
rem --auto-generate-sql-load-type 
rem 要测试的是读还是写还是两者混合的（read,write,update,mixed）
set AUTO_GENERATE_SQL_LOAD_TYPE=read,write,update,mixed
rem --number-int-cols 创建测试表的int型字段数量
set NUMBER_INT_COLS=10
rem --number-char-cols 创建测试表的chat型字段数量
set NUMBER_CHAR_COLS=10

echo benchmark exec running info --create-schema=%%DB --engine=%ENGINES% --concurrency=%CONCURRENCY% --iterations=%ITERATIONS% --number-of-queries=%NUMBER_OF_QUERIES% --auto-generate-sql-load-type=%AUTO_GENERATE_SQL_LOAD_TYPE% --number-int-cols=%NUMBER_INT_COLS% --number-char-cols=%NUMBER_CHAR_COLS%
mysqlslap -h%HOST% -P%PORT% -u%USER_NAME% -p%PASS_WORD% --create-schema=%%DB --engine=%ENGINES% --concurrency=%CONCURRENCY% --iterations=%ITERATIONS% --number-of-queries=%NUMBER_OF_QUERIES% --auto-generate-sql-load-type=%AUTO_GENERATE_SQL_LOAD_TYPE% --number-int-cols=%NUMBER_INT_COLS% --number-char-cols=%NUMBER_CHAR_COLS% --auto-generate-sql --auto-generate-sql-add-autoincrement 

pause
