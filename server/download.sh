#!/bin/bash
##############################################################################################
### create by : Meng Yan
### create time : 20210414
### usage : used to login service
### arguments :
### 	hosts.txt: name server password port
###     $1: file or dir to be uploaded
###     $2: target path
### dependency : with middle virtual machine serv.exp
##############################################################################################
names=()
servers=()
passwords=()
ports=()

<<<<<<< HEAD
while read line; do
  name=$(echo $line | awk '{print $1}')
  serv=$(echo $line | awk '{print $2}')
  pass=$(echo $line | awk -F" " '{print $3}')
  port=$(echo $line | awk -F" " '{print $4}')
  if test -z "$port"; then
    port='22'
  fi
  names=(${names[@]} $name)
  servers=(${servers[@]} $serv)
  passwords=(${passwords[@]} $pass)
  ports=(${ports[@]} $port)
done <"$(dirname $0)/host"
=======
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
done<"`dirname $0`/host"
>>>>>>> c47e3b46add5e350179c85e4c1a6a93242ec03c0

select option in ${names[@]}; do
  select_name=${option}
  break
done

for index in "${!names[@]}"; do
  if [[ $select_name = ${names[index]} ]]; then
    break
  fi
done

if [[ $select_name == '' ]]; then
  echo ">> no server selected!"
  exit 0
fi

# echo name ${names[index]}
# echo servers ${servers[index]}
# echo port ${ports[index]}
# echo pass ${passwords[index]}
echo ">> upload to ${names[index]}"
expect -c "spawn scp -P ${ports[index]} -r ${servers[index]}:$1 $2; expect *assword*; send ${passwords[index]}\r; interact"
