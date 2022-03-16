apt-get install ddclient
cp ddclient.in /usr/sbin/ddclient

echo "Please input the server url ( example: dynamicdns.key-systems.net )".
read serverURL

echo "Please input your password".
read password

echo "Please input your domainName ( example: host.example.com )".
read domainName

echo : "
# /etc/ddclient.conf  
daemon=5m  
syslog=yes  
ssl=yes  
pid=/var/run/ddclient/ddclient.pid  
cache=/var/cache/ddclient/ddclient.cache  

protocol=keysystems,
server=$serverURL,  
password='$password'  
$domainName
" > /etc/ddclient.conf
