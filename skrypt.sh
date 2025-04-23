#!/bin/bash

if [[ "$1" == "--date" ]]; then
  date

elif [[ "$1" == "--logs" ]]; then
  count=${2:-100}
  for ((i=1; i<=count; i++)); do
    filename="log$i.txt"
    echo "$filename - $(basename $0) - $(date)" > $filename
  done
fi

