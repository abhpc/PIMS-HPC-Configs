#! /bin/bash
did=`lspci |grep -i mell|awk '{print $1}'`
imac=`mstflint -d $did q|grep -i macs|awk '{print $3}'`
imac2=`echo $imac | sed 's/\(..\)/\1:/g'`
d=`echo ${imac2:0:-1}`

a=`ibstat|grep -i port|grep -i guid|awk '{print $3}'`
b=`hostname`
#echo $b $a
c=`echo $a | sed 's/\(..\)/\1:/g'`
f=`hostname -I`

echo -e "\t\thost $b {"
echo -e "\t\t\t\thardware ethernet  $d;"
echo -e "\t\t\t\toption dhcp-client-identifier =  ff:00:00:00:00:00:02:00:00:02:c9:00:${c:3:23};"
echo -e "\t\t\t\tfixed-address $f;"
echo -e "\t\t}"
