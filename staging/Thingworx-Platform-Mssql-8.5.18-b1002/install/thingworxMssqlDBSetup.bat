@echo off
REM Copyright (c) 2021, PTC Inc.  All rights reserved

REM MSSQL server sqlcmd runner script for Windows

SET server=localhost
SET serverinstance=
SET port=1433
SET adminusername=sa
SET loginname=twadmin
SET database=thingworx
SET thingworxusername=%loginname%
SET schema=twschema

:LOOP
IF NOT "%1"=="" (
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
	IF "%1"=="-l" (
		SET loginname=%2
		SHIFT
	)
	IF "%1"=="-L" (
		SET loginname=%2
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
	IF "%1"=="-u" (
		SET thingworxusername=%2
		SHIFT
	)
	IF "%1"=="-U" (
		SET thingworxusername=%2
		SHIFT
	)
	IF "%1"=="-s" (
		SET schema=%2
		SHIFT
	)
	IF "%1"=="-S" (
		SET schema=%2
		SHIFT
	)
	IF "%1"=="--help" (
		echo usage: thingworxMssqlDBSetup.bat [-h ^<server^>] [-i ^<server-instance^>] [-p ^<port^>] [-a ^<database-admin-user-name^>] [-l ^<login-name^>] [-d ^<thingworx-database-name^>] [-u ^<thingworx-user-name^>] [-s ^<schema-name^>]  
		GOTO :END
	)
	SHIFT
	GOTO :LOOP
)

echo Server=%server%
echo Server Instance=%serverinstance%
echo Port=%port%
echo Admin User=%adminusername%
echo Login Name=%loginname%
echo Database=%database%
echo Thingworx User=%thingworxusername%
echo Schema=%schema%

echo Start Execution
REM Run psql
sqlcmd.exe -S %server%\%serverinstance%,%port% -U %adminusername% -v loginname=%loginname% -v database=%database% -v thingworxusername=%thingworxusername% -v schema=%schema%  -i ./thingworx-database-setup.sql
sqlcmd.exe -S %server%\%serverinstance%,%port% -U %adminusername% -v loginname=%loginname% -v database=%database% -v thingworxusername=%thingworxusername% -v schema=%schema%  -d %database% -i ./thingworx-schema-setup.sql

pause

echo End Execution
:END
