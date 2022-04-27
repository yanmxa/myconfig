#!/bin/bash
TMPFILE=/tmp/tmp.kubecontext.XXXX
if [ ! -f ${TMPFILE} ]; then 
  TMPFILE=$(mktemp ${TMPFILE}) || exit 1
fi 

kubectl config get-contexts > ${TMPFILE}
names=()
currents=()

while read line; do
  current=$(echo $line | awk '{print $1}')
  name=$(echo $line | awk '{print $2}')
  if [[ $current = "CURRENT" ]]; then
    continue
  fi
  if [[ $line =~ "*" ]]; then
    current="`kubectl config current-context`"
  fi 
  name=$current
  names=(${names[@]} $name)
done <"${TMPFILE}"

select option in ${names[@]}; do
  select_name=${option}
  break
done

for index in "${!names[@]}"; do
  if [[ $select_name = ${names[index]} ]]; then
    break
  fi
done

kubectl config use-context $select_name