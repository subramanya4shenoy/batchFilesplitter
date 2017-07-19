@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

SET foldercount=5

FOR /l %%a in (1, 1, %foldercount%) do ( MD "Folder"%%a )

SET n=1

FOR %%f IN (*.txt) DO (
  IF !n! == !foldercount! (
    MOVE /Y "%%f" Folder!n!
    SET /A n=1
  ) ELSE (
	MOVE /Y "%%f" Folder!n!
	SET /A n+=1
  )
)

ENDLOCAL

ECHO "Religion Devides. So does this script."

PAUSE
