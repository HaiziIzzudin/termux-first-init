device_model=$(termux-info | awk '/^Device model:/{getline; gsub(/^[ \t]+|[ \t]+$/,""); print; exit}')
user=$(whoami)
ip_addr=$(ifconfig | grep 'inet 192' | awk '{print $2}')
read -p "Enter Host Machine IP address: " host_ip_address
curl -X POST http://${host_ip_address}:8000/register \
-H "Content-Type: application/json" \
-d '{"device_model":"'${device_model}'","user":"'${user}'","ip_address":"'${ip_addr}'"}'