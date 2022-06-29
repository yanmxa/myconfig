#!/bin/bash
TMPFILE=/tmp/tmp.kubenamespace.XXXX
if [ ! -f ${TMPFILE} ]; then 
  TMPFILE=$(mktemp ${TMPFILE}) || exit 1
fi 

kubectl get namespace > ${TMPFILE}
names=()
currents=()

while read line; do
  name=$(echo $line | awk '{print $1}')
  status=$(echo $line | awk '{print $2}')
  names=(${names[@]} $name)
done <"${TMPFILE}"

select option in ${names[@]}; do
  select_name=${option}
  break
done

echo ">> switch to $select_name"
kubectl config set-context --current --namespace=$select_name

# for index in "${!names[@]}"; do
#   if [[ $select_name = ${names[index]} ]]; then
#     break
#   fi
# done


# if [[ $1 == "-d" ]]; then
#   kubectl config delete-context $select_name
# else
#   kubectl config use-context $select_name
# fi