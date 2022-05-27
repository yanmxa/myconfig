#!/bin/bash

echo ">> KUBECONFIG to export: "
names=()
paths=()

while read line; do 
  name=$(echo "$line" | awk '{print $1}')
  path=$(echo "$line" | awk '{print $2}')
  names=("${names[@]}" $name)
  paths=("${paths[@]}" $path)
  # echo "${names[@]}"
  # echo ${paths[@]}
done < "$(dirname $0)/kube-config"

select option in "${names[@]}"; do
  select_name=${option}
  break
done

for index in "${!names[@]}"; do
  if [[ $select_name = ${names[index]} ]]; then
    target_path=${paths[index]}
    break
  fi
done

KUBECONFIG=$target_path
export KUBECONFIG="$target_path"
echo "export KUBECONFIG=$target_path"
echo "export KUBECONFIG=$target_path" | pbcopy