#! /bin/bash
server="localhost"
serverinstance=
port=1433
adminusername="sa"
loginname="twadmin"
database="thingworx"
thingworxusername=$loginname
schema="twschema"

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
		-l | -L )	shift
					loginname=$1
					;;
		-d | -D )	shift
					database=$1
					;;
		-u | -U )	shift
					thingworxusername=$1
					;;
		-s | -S )	shift
					schema=$1
					;;
		--help )	shift
					echo "usage: thingworxMssqlDBSetup.sh [-h <server>] [-i <server-instance>] [-p <port>] [-a <database-admin-user-name>] [-r <password>] [-l <login-name>] [-d <thingworx-database-name>] [-u <thingworx-user-name>] [-s <schema-name>]"
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
echo Login Name=$loginname
echo Database=$database
echo Thingworx User=$thingworxusername
echo Schema=$schema

echo Start Execution
# delete the file if exist
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

# create the input file
echo :setvar loginname $loginname >> param_input.sql
echo :setvar database $database >> param_input.sql
echo :setvar thingworxusername $thingworxusername >> param_input.sql
echo :setvar schema $schema >> param_input.sql

# append the script with input values
cat thingworx-database-setup.sql >> param_input.sql

sqlcmd -S $server\\$serverinstance,$port -U $adminusername -P $password  -i param_input.sql

# delete the file if exist
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

# create the input file
echo :setvar loginname $loginname >> param_input.sql
echo :setvar database $database >> param_input.sql
echo :setvar thingworxusername $thingworxusername >> param_input.sql
echo :setvar schema $schema >> param_input.sql

# append the script with input values
cat thingworx-schema-setup.sql >> param_input.sql

# schema initialization
sqlcmd -S $server\\$serverinstance,$port -U $adminusername -P $password -d $database -i param_input.sql

# delete the file if exist
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

echo End Execution
