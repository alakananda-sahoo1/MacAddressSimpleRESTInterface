echo "apikey is : $1, macaddress: $2"
if [ $1 == "" ]; then
	echo "Please enter apikey"
	exit 1
fi

if [ $2 == ""]; then
	echo "Please enter macaddress"
	exit 1
fi

echo "Creating docker images"
docker build -t macaddressimage .
echo "Images created $macaddressimage"

echo "Creating docker container"
echo "docker run -dti --name macaddress macaddressimage $1 $2"
containerid=$(docker run -dti --name macaddress  macaddressimage $1 $2)
echo "Container id : $containerid"

if [ $containerid == "" ];then
	echo "Container not created successfully Aborting the execution"
	exit 1
else
	echo "logging into the container"
	echo "docker exec -it $containerid /bin/ash -c "/home/macaddress/invokemacapi.sh '$1' '$2'""
	docker exec -it $containerid /bin/ash -c "/home/macaddress/invokemacapi.sh '$1' '$2'"
fi

echo "stoping and Deleting the container"
echo "docker stop $containerid"
docker stop $containerid
echo "docker rm $containerid"
docker rm $containerid
