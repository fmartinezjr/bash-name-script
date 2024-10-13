#!/bin/bash


unwanted_characters_pattern='[\/<>:"|?*\.]'

rename_files_in_folder(){
    local folder=$1

    find "$folder" -type f ! -name ".*" | while IFS= read -r file; do
        dir_name=$(dirname "$file")
        base_name=$(basename "$file")

        echo -e "Before\n$base_name\n"

        new_base_name=$(echo "$base_name" | sed "s/$unwanted_characters_pattern//g")
        
        new_base_name=$(node -e "
            const unwanted_emoji_pattern = /[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}]/gu;

            const filename = '$base_name';

            const result = filename.replace(unwanted_emoji_pattern, '');
            console.log(result)
        ")

        if [ "$base_name" != "$new_base_name" ]; then
            mv "$file" "$dir_name/$new_base_name"
            echo -e "Renamed file\n$new_base_name"
        else
            echo -e "Original file name kept\n$base_name\n"
        fi
    done
}

if [ -z "$1" ]; then
    echo "missing folder path"
    exit 1
fi

rename_files_in_folder "$1"