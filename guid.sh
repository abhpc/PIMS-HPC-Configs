#! /bin/bash
did=`lspci |grep -i mell|awk '{print $1}'`
imac=`mstflint -d $did q|grep -i macs|awk '{print $3}'`
imac2=`echo $imac | sed 's/\(..\)/\1:/g'`
mac=`echo ${imac2:0:-1}`

iguid=`ibstat|grep -i port|grep -i guid|awk '{print $3}'`
host=`hostname`
#echo $b $a
iguid2=`echo $iguid | sed 's/\(..\)/\1:/g'`
ip=`hostname -I`

echo -e "\t\thost $host {"
echo -e "\t\t\t\thardware ethernet  $mac;"
echo -e "\t\t\t\toption dhcp-client-identifier =  ff:00:00:00:00:00:02:00:00:02:c9:00:${iguid2:3:23};"
echo -e "\t\t\t\tfixed-address $ip;"
echo -e "\t\t}"
