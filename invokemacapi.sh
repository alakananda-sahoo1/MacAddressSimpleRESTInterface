echo "apikey: $1 and macaddress: $2"
# Passing the api uri
apiurl="https://api.macaddress.io/v1?apiKey=$1&output=json&search=$2"
#Will provide output of HTTP response as per below with desired values after hitting into destination server
echo "Calling mac address api: $apiurl"
echo "curl --request GET -H Content-Type:application/json $apiurl"
HTTP_RESPONSE=$(curl --request GET -H "Content-Type:application/json" "$apiurl" | jq '.vendorDetails.companyName')
echo "$2 MAC address belongs to $HTTP_RESPONSE"
