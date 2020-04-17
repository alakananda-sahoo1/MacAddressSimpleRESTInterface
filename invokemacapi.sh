echo "Calling mac address api"
# Passing the api uri
apiurl='https://api.macaddress.io/v1'
Message='{"apikey": "'"$1"'", "MacAddress": "'"$2"'"}'
#Will provide output of HTTP response as per below with desired values after hitting into destination server
HTTP_RESPONSE$(curl --request POST --data "$Message" -H "Content-Type:application/json" "$apiurl")
HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g')
echo "Response from api is $HTTP_BODY"
