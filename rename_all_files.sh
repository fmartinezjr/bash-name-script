#!/bin/bash


unwanted_characters_pattern='[\/<>:"|?*\.]'
#unwanted_emoji_pattern='[\x{1F600}-\x{1F64F}\x{1F300}-\x{1F5FF}\x{1F680}-\x{1F6FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}]'

rename_files_in_folder(){
    local folder=$1

    find "$folder" -type f ! -name ".*" | while IFS= read -r file; do
        dir_name=$(dirname "$file")
        base_name=$(basename "$file")

        echo -e "$base_name\n"

        new_base_name=$(echo "$base_name" | sed "s/$unwanted_characters_pattern//g")

        if [ "$base_name" != "$new_base_name" ]; then
            mv "$file" "$dir_name/$new_base_name"
            echo -e "Renamed\n$new_base_name"
        else
            echo -e "Original kept\n$base_name\n"
        fi

    done
}

if [ -z "$1" ]; then
    echo "missing folder path"
    exit 1
fi

rename_files_in_folder "$1"