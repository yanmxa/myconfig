#!/bin/bash
##############################################################################################
### create by : Meng Yan
### create time : 20210414
### usage : login service with expect
### arguments : hosts: name user@server password [port]
##############################################################################################
names=()
servers=()
passwords=()
ports=()

while read line; do
  name=$(echo $line | awk -F" " '{print $1}')
  serv=$(echo $line | awk -F" " '{print $2}')
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

<<<<<<< HEAD
select option in ${names[@]}; do
  select_name=${option}
  break
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

select option in ${names[@]}
do
	select_name=${option}
    break;
>>>>>>> c47e3b46add5e350179c85e4c1a6a93242ec03c0
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

echo ">> login to ${names[index]}"
if [ "${passwords[index]}" == "" ]; then
  expect -c "spawn ssh ${servers[index]} -p ${ports[index]}; interact"
else
  expect -c "spawn ssh ${servers[index]} -p ${ports[index]}; expect *assword*; send ${passwords[index]}\r; interact"
fi
