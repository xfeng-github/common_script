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
docker run --name %CONIAINER_NAME% -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "cluster.name=elasticsearch" -v %DATA_PATH%\plugins:/usr/share/elasticsearch/plugins -v %DATA_PATH%\data:/usr/share/elasticsearch/data elasticsearch:7.6.2
rem 具体执行命令 end

pause