This project about program that will query https://macaddress.io ,returning with output MACaddress associated with which company and dockerize the above program that will take command line arguments.

Prerequisites
Any Linux server with Docker installed.Refer the document to install the docker https://docs.docker.com/install/linux/docker-ce/

signup in https://macaddress.io and get the apikey to be used as input to generate the output.

Usage
Here having Shell script <mac_address_identifier.sh> to automate the docker image buildingand running process.Now run the above script.

                             ./mac_address_identifier.sh 1 44:38:39:ff:ef:57  

   when you run above command after passing api_key and Macaddress the apikey and give apikey value 
     
   Output is Like
				it will print "apikey is : 1, macaddress: 44:38:39:ff:ef:57"

If you want check another Mac Address give 1 as input if not type 0 it will exit program


   
