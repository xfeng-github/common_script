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
docker run --name %CONIAINER_NAME% -d -p 80:80 -v %DATA_PATH%/html:/usr/share/nginx/html -v %DATA_PATH%/logs:/var/log/nginx -v %DATA_PATH%/conf:/etc/nginx nginx:1.10
rem 具体执行命令 end

pause