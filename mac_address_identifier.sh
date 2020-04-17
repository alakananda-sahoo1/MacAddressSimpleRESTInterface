echo "apikey is : $1, macaddress: $2"
# The below line of code will validate null value entry for security authentication of api_key
if [ $1 == "" ]; then
	echo "Please enter apikey"
	exit 1
fi
#This parameter will check for mac address as entered from user 
if [ $2 == ""]; then
	echo "Please enter macaddress"
	exit 1
fi

echo "Create docker images"
# The below is command is creating from current directory 
docker build -t macaddressimage .
echo "Images created $macaddressimage"

echo "Create docker container"
#This parameter is picking unique container id and creating container up and running 
containerid=$(docker run -dti --name macaddress macaddressimage)
#Based upon container id in case null will exit else will proceed further to log in into docker container
if [ $containerid == "" ];then
	echo "Container not created successfully Aborting the execution"
	exit 1
else
	echo "logging into the container"
	docker exec -it $containerid /bin/ash -c '/home/macaddress/invokemacapi.sh $1 $2'
fi
