@ECHO OFF
chcp 65001

ECHO Ingrese nombre commit:
SET /p commit_name=""
GOTO check
  

:chequeo
IF "%commit_name%" == "" (
	ECHO Commit vacío
	GOTO exit 
) ELSE (
	GOTO commit
)

:commit
git.exe add .
git.exe commit -m "%commit_name%"
git.exe push
ECHO Commiteado correctamente :)

:exit
PAUSE