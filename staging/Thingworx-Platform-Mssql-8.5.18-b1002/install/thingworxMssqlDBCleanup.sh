#! /bin/bash
server="localhost"
serverinstance=
port=1433
adminusername="sa"
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
		-a | -A )	shift
					adminusername=$1
					;;
		-r | -R )	shift
					password=$1
					;;
		-d | -D )	shift
					database=$1
					;;
		--help )	shift
					echo "usage: thingworxMssqlDBCleanup.sh [-h <server>] [-i <server-instance>] [-p <port>] [-a <database-admin-user-name>] [-r <password>] [-d <thingworx-database-name>] "
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
echo Admin User=$adminusername
echo Database=$database

# delete the file if exist
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

# create the input file
echo :setvar database $database >> param_input.sql

# append the script with input values
cat thingworx-database-cleanup.sql >> param_input.sql
 
 echo Start Execution
 
sqlcmd -S $server\\$serverinstance,$port -U $adminusername -P $password -d master -i param_input.sql

# delete the file
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

echo End Execution
