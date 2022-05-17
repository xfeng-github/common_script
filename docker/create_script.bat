@echo off
SET CURPATH=%cd%

rem NAME 文件名 CONIAINER_NAME 容器名 DATA_DIRECTORY 数据文件名
SET NAME=%1
SET CONIAINER_NAME=%2
SET DATA_DIRECTORY=%3
SET ERROR_MSG=null

echo "Run the script based on the template build container script"
echo "NAME is %NAME%, CONIAINER_NAME is %CONIAINER_NAME%, DATA_DIRECTORY is %DATA_DIRECTORY%"

rem $1 文件名 $2容器名 $3数据文件名
if "%NAME%" == "" (
	echo "please enter directory of container script:"
	SET /p NAME=
)

if "%CONIAINER_NAME%" == "" (
	echo "please enter container name:"
	SET /p CONIAINER_NAME=
)

if "%DATA_DIRECTORY%" == "" (
	echo "please enter directory of container store data:"
	SET /p DATA_DIRECTORY=
)

echo "NAME is %NAME%, CONIAINER_NAME is %CONIAINER_NAME%, DATA_DIRECTORY is %DATA_DIRECTORY%"

if "%NAME%" == "" (
	SET ERROR_MSG=Directory of container script not be null
	goto error
)

if "%CONIAINER_NAME%" == "" (
	SET ERROR_MSG=Container name not be null
	goto error
)

if "%DATA_DIRECTORY%" == "" (
	SET ERROR_MSG=Directory of container store data not be null
	goto error
)

SET NAME_PATH=%CURPATH%\%NAME%
if exist %NAME_PATH% (
 	SET ERROR_MSG=Directory of container script already exist
 	goto error
 )

rem 具体执行命令 start
mkdir %NAME_PATH%
xcopy /E template %NAME%
echo %CONIAINER_NAME% > %NAME_PATH%\config\name
echo %DATA_DIRECTORY% > %NAME_PATH%\config\data_directory
echo /%DATA_DIRECTORY% > %NAME_PATH%\.gitignore
rem 具体执行命令 end

rem 执行成功
:success
echo success
goto done

rem 执行失败
:error
echo "%ERROR_MSG%"

:done
pause