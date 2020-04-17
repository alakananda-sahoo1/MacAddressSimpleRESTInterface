echo "Calling mac address api"
apiurl='https://api.macaddress.io/v1'
Message='{"apikey": "'"$1"'", "MacAddress": "'"$2"'"}'
HTTP_RESPONSE$(curl --request POST --data "$Message" -H "Content-Type:application/json" "$apiurl")
HTTP_BODY=$(echo $HTTP_RESPONSE | sed -e 's/HTTPSTATUS\:.*//g')
echo "Response from api is $HTTP_BODY"
