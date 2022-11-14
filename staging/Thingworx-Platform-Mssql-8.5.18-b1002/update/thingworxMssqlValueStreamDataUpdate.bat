@echo off
REM Copyright (c) 2021, PTC Inc.  All rights reserved

REM MSSQL server sqlcmd runner script for Windows

SET server=localhost
SET serverinstance=
SET port=1433
SET loginname=twadmin
SET database=thingworx

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
	IF "%1"=="--help" (
		echo Migrates the Thingworx Value stream data.
		echo.
		echo usage: thingworxMssqlValueStreamDataMigrate.bat [-h ^<server^>] [-i ^<server-instance^>] [-p ^<port^>] [-l ^<login-name^>] [-d ^<thingworx-database-name^>] 
		GOTO :END
	)
	SHIFT
	GOTO :LOOP
)

echo Server=%server%
echo Server Instance=%serverinstance%
echo Port=%port%
echo User=%loginname%
echo Database=%database%

echo Start Execution

sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./bigint_ValueStream_update_Data_Migration.sql

echo End Execution
:END
