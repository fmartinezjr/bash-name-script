#!/bin/bash


unwanted_characters_pattern='[\/<>:"|?*\.]'
unwanted_emoji_pattern='[\x{1F600}-\x{1F64F}\x{1F300}-\x{1F5FF}\x{1F680}-\x{1F6FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}]'

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