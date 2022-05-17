@echo off
SET CURPATH=%cd%
SET DATA_PATH="%CURPATH%\jenkins_home"

echo %DATA_PATH%

if not exist %DATA_PATH% (
	mkdir %DATA_PATH%
)

rem 具体执行命令 start
docker run --name jenkins -p 8080:8080 -p 50000:50000 -v %DATA_PATH%:/var/jenkins_home jenkins/jenkins:lts-jdk11
rem 具体执行命令 end

pause