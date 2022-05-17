@echo off
SET CURPATH=%cd%

for /f %%i in ('type config\name') do (
  SET CONIAINER_NAME=%%i
)

for /f %%i in ('type config\data_directory') do (
  SET DATA_DIRECTORY=%%i
)

SET DATA_PATH="%CURPATH%\%DATA_DIRECTORY%"


if not exist %DATA_PATH% (
	mkdir %DATA_PATH%
)

rem 具体执行命令 start
docker run -p 3306:3306 --name %CONIAINER_NAME% -v %DATA_PATH%/log:/var/log/mysql -v %DATA_PATH%/data:/var/lib/mysql -v %DATA_PATH%/conf:/etc/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7
rem 具体执行命令 end

pause