@echo off
REM Copyright (c) 2021, PTC Inc.  All rights reserved

REM MSSQL server sqlcmd runner script for Windows

SET server=localhost
SET serverinstance=
SET port=1433
SET loginname=twadmin
SET database=thingworx
SET option=all

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
	IF "%1"=="-o" (
		SET option=%2
		SHIFT
	)
	IF "%1"=="-O" (
		SET option=%2
		SHIFT
	)
	IF "%1"=="--help" (
		echo usage: thingworxMssqlSchemaSetup.bat [-h ^<server^>] [-i ^<server-instance^>] [-p ^<port^>] [-l ^<login-name^>] [-d ^<thingworx-database-name^>] [-o ^<option ^(all,model,data,property,enablesso,modelwithproperty^)^>]
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
echo Option=%option%

echo Start Execution

if "%option%" == "all" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-model-schema.sql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-property-schema.sql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-data-schema.sql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-grants-schema.sql
pause
)

if "%option%" == "enablesso" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-grants-schema.sql
pause
)

if "%option%" == "model" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-model-schema.sql
pause
)

if "%option%" == "property" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-property-schema.sql
pause
)

if "%option%" == "data" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-data-schema.sql
pause
)

if "%option%" == "modelwithproperty" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-model-schema.sql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-property-schema.sql
pause
)

echo End Execution
:END
