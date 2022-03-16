apt-get install ddclient
apt-get install libio-socket-inet6-perl 
cp ddclient.in /usr/sbin/ddclient

echo "Please input the server url ( example: dynamicdns.key-systems.net )".
read serverURL

echo "Please input your password".
read password

echo "Please input your domainName ( example: host.example.com )".
read domainName

echo : "
# /etc/ddclient.conf 

protocol=keysystems,
server=$serverURL,  
password='$password'  
" > /etc/ddclient.conf

if [ ! -d /etc/ddclient/ ]
then
    mkdir /etc/ddclient/
else
    echo "Directory exists"
fi

touch /etc/ddclient/ddclient.conf

echo : "
# /etc/ddclient/ddclient.conf
daemon=5m  
syslog=yes  
ssl=yes  
pid=/var/run/ddclient/ddclient.pid  
cache=/var/cache/ddclient/ddclient.cache  
use=if, if=wlan0  

protocol=keysystems,
server=$serverURL,  
password='$password'  
$domainName
" > /etc/ddclient/ddclient.conf
