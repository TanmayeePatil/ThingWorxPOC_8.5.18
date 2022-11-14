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
					echo "Updates Thingworx database schema from a previous 8.2 installation."
					echo ""
					echo "usage: thingworxMssqlSchemaUpdate.sh [-h <server>] [-i <server-instance>] [-p <port>] [-l <login-name>] [-r <password>] [-d <thingworx-database-name>] [-o <option (all,model,data)>]"
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

# delete the file if exist
if [ -f param_input.sql ] 
then
 rm param_input.sql
fi

# create the input file
echo :setvar database $database >> param_input.sql

# append the script with input values
cat thingworx-schema-update.sql >> param_input.sql

if [ "$option" = "all" ]
then
 # append the scripts with input values
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-model-schema-8.2-to-8.3.sql 
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-data-schema-8.2-to-8.3.sql 
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-property-schema-8.2-to-8.3.sql 
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-grants-schema-8.2-to-8.3.sql 
fi

if [ "$option" = "model" ]
then
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-model-schema-8.2-to-8.3.sql
fi

if [ "$option" = "data" ]
then
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-data-schema-8.2-to-8.3.sql
fi

if [ "$option" = "property" ]
then
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-property-schema-8.2-to-8.3.sql
fi

if [ "$option" = "enablesso" ]
then
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-grants-schema-8.2-to-8.3.sql
fi

if [ "$option" = "modelwithproperty" ]
then
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d master -i param_input.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-model-schema-8.2-to-8.3.sql
 sqlcmd -S $server\\$serverinstance,$port -U $loginname -P $password -d $database -i thingworx-update-property-schema-8.2-to-8.3.sql
fi

# delete the file
if [ -f param_input.sql ]
then
 rm param_input.sql
fi

echo End Execution
