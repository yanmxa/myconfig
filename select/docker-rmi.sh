#!/bin/bash
TMPFILE=/tmp/tmp.dockerimages.XXXX
if [ ! -f ${TMPFILE} ]; then 
  TMPFILE=$(mktemp ${TMPFILE}) || exit 1
fi 

docker images > ${TMPFILE}
images=()
image_names=()
image_ids=()
image_tags=()

while read line; do
  image_name=$(echo $line | awk '{print $1}')
  image_id=$(echo $line | awk '{print $3}')
  image_tag=$(echo $line | awk '{print $2}')

  images=("${images[@]}" "$line")
  image_names=(${image_names[@]} "$image_name")
  image_ids=(${image_ids[@]} "$image_id")
  image_tags=(${image_tags[@]} "$image_tag")
done <"${TMPFILE}"

for (( i = 0; i < ${#images[@]}; i++ )); do
    if [[ "${images[$i]}" =~ "<none>" ]]; then
      docker rmi "${image_names[$i]}:${image_ids[$i]}"
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

docker rmi "${image_names[$i]}:${image_ids[$i]}"


