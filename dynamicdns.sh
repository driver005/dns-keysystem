apt-get install ddclient
cp ddclient.in /usr/sbin/ddclient

echo "Please input the server url ( example: dynamicdns.key-systems.net )".
read serverURL

echo "Please input your password".
read password

echo "Please input your domainName ( example: host.example.com )".
read domainName

echo : "
protocol=keysystems,  
server=$(serverURL),  
password='$(password)' 
" > /etc/ddclient.conf  

echo : "
daemon=5m  
syslog=yes  
ssl=yes  
pid=/var/run/ddclient/ddclient_eth0.pid  
cache=/var/cache/ddclient/ddclient_eth0.cache  
use=if, if=eth0  

protocol=keysystems,
server=$(serverURL),  
password='$(password)'  
$(domainName)
" > /etc/ddclient/ddclient_eth0.conf
