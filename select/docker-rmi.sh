#!/bin/bash
TMPFILE=/tmp/tmp.dockerimages.XXXX
if [ ! -f ${TMPFILE} ]; then 
  TMPFILE=$(mktemp ${TMPFILE}) || exit 1
fi 

docker images > ${TMPFILE}
images=()
image_ids=()

while read line; do
  image_info="$line"
  image_id=$(echo $line | awk '{print $3}')
  images=("${images[@]}" "$image_info")
  image_ids=(${image_ids[@]} "$image_id")
done <"${TMPFILE}"

for (( i = 0; i < ${#images[@]}; i++ )); do
    if [[ "${images[$i]}" =~ "<none>" ]]; then
      docker rmi ${image_ids[$i]}
    fi
done

for (( i = 0; i < ${#images[@]}; i++ )); do
    if [[ $i == 0 ]]; then
      echo "    ${images[$i]}" 
      continue
    fi
    echo "$i) ${images[$i]}"
done
read -t 50 -p "#? " index

docker rmi ${image_ids[$index]}

