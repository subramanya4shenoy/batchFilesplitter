@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

SET foldercount=5

SET "file=file/file_list.txt"


SET /A i=0

FOR /l %%a in (1, 1, %foldercount%) do ( MD "Folder"%%a )

FOR /F "usebackq delims=" %%a in ("%file%") DO (

SET /A i+=1

CALL SET array[%%i%%]=%%a

CALL SET m=%%i%%
)

SET n=1

REM FOR /L %%i in (1,1,%m%) do call echo %%array[%%i]%%

REM FOR %%f IN (*.txt) DO (

FOR /L %%i in (1,1,%m%) DO (
  IF !n! == !foldercount! (
    MOVE /Y ./!array[%%i]! Folder!n!
    SET /A n=1
  ) ELSE (
	MOVE /Y !array[%%i]! Folder!n!
	SET /A n+=1
  )
)

ENDLOCAL

ECHO "Religion Devides. So does this script."

PAUSE
