#!/bin/bash 
##############################################################################################
### create by : Meng Yan
### create time : 20220414
### usage : select the specific command to exec
### arguments : 
###       $1: config file [format with: name + \t + parameters with space]
###       $2 shell to exec the config information
##############################################################################################

config=$1
exec_shell=$2

names=()
parameters=()

while read line; do
  name=$(echo $line | awk -F"=>" '{print $1}')
  parameter=$(echo $line | awk -F"=>" '{print $2}')
  parameter=$(echo $parameter | sed s/\ /\#/g)

  names=(${names[@]} $name)
  parameters=(${parameters[@]} "${parameter}")
done <"${config}"

select option in ${names[@]}; do
  select_name=${option}
  break
done

for index in "${!names[@]}"; do
  if [[ $select_name = ${names[index]} ]]; then
    break
  fi
done

# if [[ $select_name == '' ]]; then
#   echo ">> Empty Select!"
#   exit 0
# fi

# echo "${parameters}"
echo ">> Switch to ${names[index]}"
sh ${exec_shell} $(echo ${parameters[index]} | sed s/\#/\ /g)

# if [ "${passwords[index]}" == "-1" ]; then
#   expect -c "spawn ssh ${servers[index]} -p ${ports[index]}; interact"; 
# else
#   expect -c "spawn ssh ${servers[index]} -p ${ports[index]}; expect *assword*; send ${passwords[index]}\r; interact"
# fi