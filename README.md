This project about program that will query https://macaddress.io ,returning with output MACaddress associated with which company and dockerize the above program that will take command line arguments.

Prerequisites
Any Linux server with Docker installed.Refer the document to install the docker https://docs.docker.com/install/linux/docker-ce/

signup in https://macaddress.io and get the apikey to be used as input to generate the output.

Usage:
Prerequiste : Must have docker and linux OS of any latest version.
Here having Shell script <mac_address_identifier.sh> to automate the docker image building and running process.Now run the above script.

                             ./mac_address_identifier.sh <apikey> <MAC Address>  

   when you run above command after passing api_key and Macaddress the apikey and give apikey value 
     
   Output is Like
   
		<Address of MAC> Mac Address belongs to <Company Name>

FEW CRITICAL SECURITY PRACTICES TAKEN CARE HERE AS : 

#Prefered alpine-based images over full-blown system OS images

#Useed COPY instead of ADD since Arbitrary URLs specified for ADD could result in MITM attacks, or sources of malicious data. 
In addition, ADD implicitly unpacks local archives which may not be expected and result in path traversal .

#Used a .dockerignore file to avoid a hazardous COPY instruction,which pulls in sensitive files that are part of the build context

#Usied api-key as security authetication on fetching MAC data 

