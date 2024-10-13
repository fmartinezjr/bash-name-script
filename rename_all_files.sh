#!/bin/bash

name_files_in_folder(){
  local folder=$1
  echo "hello"
  echo ${folder}
}

if [ -z "$1" ]; then
    echo "missing folder path"
    exit 1
fi

name_files_in_folder "$1"