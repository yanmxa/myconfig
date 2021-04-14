#!/bin/bash
##############################################################################################
### create by : Meng Yan
### create time : 20210414
### usage : used to login service 
### arguments : hosts.txt: name server password port
### dependency : with middle virtual machine serv.exp
##############################################################################################
names=()
servers=()
passwords=()
ports=()

while read line 
do
	name=`echo $line | awk '{print $1}'`
	serv=`echo $line | awk '{print $2}'`
	pass=`echo $line | awk -F" " '{print $3}'`
	port=`echo $line | awk -F" " '{print $4}'`
	if test -z "$port"
	then
		port='22'
	fi
	names=(${names[@]} $name)
	servers=(${servers[@]} $serv)
	passwords=(${passwords[@]} $pass)
	ports=(${ports[@]} $port)
done<"`pwd`/host.txt"

select option in ${names[@]}
do
	name=${option}
    break;
done

for index in "${!names[@]}"
do
	if [[ $name = ${names[index]} ]]
	then 
		break
	fi
done

# echo name ${names[index]}
# echo servers ${servers[index]}
# echo port ${ports[index]}
# echo pass ${passwords[index]}
echo ">> login to ${names[index]}"
expect -c 'spawn ssh '"${servers[index]} -p ${ports[index]}"'; expect "*assword*"; send '"${passwords[index]}\r"'; interact'
