#!/bin/bash

IFS=$'\n'
paths=($(find . -name "*.ttl"))
unset IFS

i=0
len=${#paths[@]}

while [ $i -lt "$len" ]
do
  result=$(ttl "${paths[$i]}")
  retval=$?

  if [ $retval -ne 0 ]; then
    echo "${paths[$i]}"
    echo "$result"
    echo ""
  fi

  ((i++))
done

echo "Checked $len files."
