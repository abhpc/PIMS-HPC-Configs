#! /bin/bash
iguid=`ibstat|grep -i port|grep -i guid|awk '{print $3}'`
host=`hostname`
#echo $b $a
iguid2=`echo $iguid | sed 's/\(..\)/\1:/g'`
imac1=`echo ${iguid2:3:9}`
imac2=`echo ${iguid2:${#iguid2}-9:-1}`
ip=`hostname -I`

echo -e "\t\thost $host {"
echo -e "\t\t\t\thardware ethernet  $imac1$imac2;"
echo -e "\t\t\t\toption dhcp-client-identifier =  ff:00:00:00:00:00:02:00:00:02:c9:00:${iguid2:3:23};"
echo -e "\t\t\t\tfixed-address $ip;"
echo -e "\t\t}"
