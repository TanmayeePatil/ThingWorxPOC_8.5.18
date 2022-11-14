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
		echo Updates Thingworx database schema from a previous 8.3 installation.
		echo.
		echo usage: thingworxMssqlSchemaUpdate.bat [-h ^<server^>] [-i ^<server-instance^>] [-p ^<port^>] [-l ^<login-name^>] [-d ^<thingworx-database-name^>] [-o ^<option ^(all,model,data^)^>]
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
REM thingworx-schema-update
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql


REM thingworx-update-model-schema-8.3-to-8.4
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-model-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-model-schema-8.3-to-8.4.log
type thingworx-update-model-schema-8.3-to-8.4.log


REM thingworx-update-data-schema-8.3-to-8.4
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-data-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-data-schema-8.3-to-8.4.log
type thingworx-update-data-schema-8.3-to-8.4.log

REM thingworx-update-property-schema-8.3-to-8.4
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-property-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-property-schema-8.3-to-8.4.log
type thingworx-update-property-schema-8.3-to-8.4.log

REM thingworx-update-grants-schema-8.3-to-8.4
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-grants-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-grants-schema-8.3-to-8.4.log
type thingworx-update-grants-schema-8.3-to-8.4.log

pause
)

if "%option%" == "model" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-model-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-model-schema-8.3-to-8.4.log
type thingworx-update-model-schema-8.3-to-8.4.log
pause
)

if "%option%" == "data" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-data-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-data-schema-8.3-to-8.4.log
type thingworx-update-data-schema-8.3-to-8.4.log
pause
)

if "%option%" == "property" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-property-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-property-schema-8.3-to-8.4.log
type thingworx-update-property-schema-8.3-to-8.4.log
pause
)

if "%option%" == "enablesso" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-grants-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-grants-schema-8.3-to-8.4.log
type thingworx-update-grants-schema-8.3-to-8.4.log
pause
)

if "%option%" == "modelwithproperty" (
REM Run psql
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d master -i ./thingworx-schema-update.sql
REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-model-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-model-schema-8.3-to-8.4.log
type thingworx-update-model-schema-8.3-to-8.4.log

REM as the prompt for password is piped to a file, user is not able to figure out when to provide the password. Hence, we echo the prompt
echo.
echo|set /P ="Password: "
sqlcmd -S %server%\%serverinstance%,%port% -U %loginname% -v database=%database% -d %database% -i ./thingworx-update-property-schema-8.3-to-8.4.sql 1>temp.log 2>&1 | type temp.log
findstr /v "Password: " temp.log > thingworx-update-property-schema-8.3-to-8.4.log
type thingworx-update-property-schema-8.3-to-8.4.log
pause
)

del temp.log
echo End Execution
:END
