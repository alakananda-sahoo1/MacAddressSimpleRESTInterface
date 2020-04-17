echo "apikey is : $1, macaddress: $2"
if [ $1 == "" ]; then
	echo "Please enter apikey"
	exit 1
fi

if [ $2 == ""]; then
	echo "Please enter macaddress"
	exit 1
fi

echo "Create docker images"
docker build -t macaddressimage .
echo "Images created $macaddressimage"

echo "Create docker container"
containerid=$(docker run -dti --name macaddress macaddressimage)

if [ $containerid == "" ];then
	echo "Container not created successfully Aborting the execution"
	exit 1
else
	echo "logging into the container"
	docker exec -it $containerid /bin/ash -c '/home/macaddress/invokemacapi.sh $1 $2'
fi
