@echo off
SET CURPATH=%cd%
SET DATA_PATH="%CURPATH%\nexus-data"

if not exist %DATA_PATH% (
	mkdir %DATA_PATH%
)

rem 具体执行命令 start
docker run -d -p 8081:8081 -v %DATA_PATH%:/nexus-data --name nexus sonatype/nexus3
rem 具体执行命令 end

pause