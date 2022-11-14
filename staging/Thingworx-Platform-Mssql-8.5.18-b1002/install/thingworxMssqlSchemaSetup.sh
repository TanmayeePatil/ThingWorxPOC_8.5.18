#! /bin/bash
server="localhost"
serverinstance=
port=1433
loginname="twadmin"
database="thingworx"
option="all"

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
		-o | -O )	shift
					option=$1
					;;
		--help )	shift
					echo "usage: thingworxMssqlSchemaSetup.sh [-h <server>] [-i <server-instance>] [-p <port>] [-l <login-name>] [-r <password>] [-d <thingworx-database-name>] [-o <option (all,model,data,property,enablesso,modelwithproperty)>]"
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
echo Option=$option

echo Start Execution

if [ "$option" = "all" ]
then
 # append the scripts with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-model-schema.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-property-schema.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-data-schema.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-grants-schema.sql
fi

if [ "$option" = "enablesso" ]
then
 # append the scripts with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-grants-schema.sql
fi

if [ "$option" = "model" ]
then
 # append the scripts with input values
  sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-model-schema.sql
fi

if [ "$option" = "property" ]
then
 # append the script with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-property-schema.sql
fi

if [ "$option" = "data" ]
then
 # append the script with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-data-schema.sql
fi

if [ "$option" = "modelwithproperty" ]
then
 # append the scripts with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-model-schema.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-property-schema.sql
fi

echo End Execution
