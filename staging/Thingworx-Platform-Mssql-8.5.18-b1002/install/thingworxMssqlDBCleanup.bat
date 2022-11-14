@echo off
REM Copyright (c) 2021, PTC Inc.  All rights reserved

REM MSSQL server sqlcmd runner script for Windows

SET server=localhost
SET serverinstance=
SET port=1433
SET adminusername=sa
SET database=thingworx

:LOOP
IF NOT "%1"==""  (
	IF "%1"=="-h" (
		SET server=%2
		SHIFT
	)
	IF "%1"=="-H" (
		SET server=%2
		SHIFT
	)
	IF "%1"=="-i" (
		SET serverinstance=%2
		SHIFT
	)
	IF "%1"=="-I" (
		SET serverinstance=%2
		SHIFT
	)
	IF "%1"=="-p" (
		SET port=%2
		SHIFT
	)
	IF "%1"=="-P" (
		SET port=%2
		SHIFT
	)
	IF "%1"=="-a" (
		SET adminusername=%2
		SHIFT
	)
	IF "%1"=="-A" (
		SET adminusername=%2
		SHIFT
	)
	IF "%1"=="-d" (
		SET database=%2
		SHIFT
	)
	IF "%1"=="-D" (
		SET database=%2
		SHIFT
	)
	IF "%1"=="--help" (
		echo usage: thingworxMssqlDBCleanup.bat [-h ^<server^>] [-i ^<server-instance^>] [-p ^<port^>] [-a ^<database-admin-user-name^>] [-d ^<thingworx-database-name^>] 
		SHIFT
		GOTO :END
	)
	SHIFT
	GOTO :LOOP
)

echo Server=%server%
echo Server Instance=%serverinstance%
echo Port=%port%
echo Admin User=%adminusername%
echo Database=%database%

echo Start Execution

sqlcmd -S %server%\%serverinstance%,%port% -U %adminusername% -v database=%database% -d master -i ./thingworx-database-cleanup.sql
pause

echo End Execution
:END
