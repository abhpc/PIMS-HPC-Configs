#! /bin/bash
a=`ibstat|grep -i port|grep -i guid|awk '{print $3}'`
b=`hostname`
#echo $b $a
c=`echo $a | sed 's/\(..\)/\1:/g'`
d=`echo ${c:3:9}`
e=`echo ${c:${#c}-9:-1}`
f=`hostname -I`

echo -e "\t\thost $b {"
echo -e "\t\t\t\thardware ethernet  $d$e;"
echo -e "\t\t\t\toption dhcp-client-identifier =  ff:00:00:00:00:00:02:00:00:02:c9:00:${c:3:23};"
echo -e "\t\t\t\tfixed-address $f;"
echo -e "\t\t}"
