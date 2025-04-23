#!/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  echo "Available options:"
  echo "--date / -d      show current date"
  echo "--logs [n] / -l  create n log files (default 100)"
  echo "--init           clone repo and add to PATH"
  echo "--help / -h      show this help"

elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
  date

elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
  count=${2:-100}
  for ((i=1; i<=count; i++)); do
    filename="log$i.txt"
    echo "$filename - $(basename $0) - $(date)" > $filename
  done

elif [[ "$1" == "--init" ]]; then
  repo_url=$(git config --get remote.origin.url)
  clone_dir="repo_clone"

  git clone "$repo_url" "$clone_dir"

  abs_path=$(realpath "$clone_dir")
  export PATH="$abs_path:$PATH"
  echo "Repository cloned to $abs_path and added to PATH"
fi

