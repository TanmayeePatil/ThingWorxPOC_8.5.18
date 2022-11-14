#! /bin/bash
server="localhost"
serverinstance=
port=1433
loginname="twadmin"
database="thingworx"

while [ "$1" != "" ]; do
	case $1 in
		-h | -H )	shift
					server=$1
					;;
		-i | -I )	shift
					serverinstance=$1
					;;
		-p | -P )	shift
					port=$1
					;;
		-l | -L )	shift
					loginname=$1
					;;
		-r | -R )	shift
					password=$1
					;;
		-d | -D )	shift
					database=$1
					;;
		--help )	shift
					echo "Updates Thingworx Value stream Schema."
					echo ""
					echo "usage: thingworxMssqlValueStreamSchemaUpdate.sh [-h <server>] [-i <server-instance>] [-p <port>] [-l <login-name>] [-r <password>] [-d <thingworx-database-name>]"
					exit 1
					;;
		* )
					echo Unknown Option $1
					exit 1
					;;
	esac
	shift
done

echo Server=$server
echo Server Instance=$serverinstance
echo Port=$port
echo User=$loginname
echo Database=$database

echo Start Execution

 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i bigint_ValueStream_update_Schema.sql

echo End Execution
