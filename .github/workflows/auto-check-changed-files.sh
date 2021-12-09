#!/bin/bash

echo "run-sh: Inside auto-check-changed-files.sh"

# print content of json holding all files to be checked
a=$(cat /home/runner/files.json)
echo "Content of files.json: $a" 

# get number of files to check
num_files=$(jq '. | length' /home/runner/files.json)
echo "number of files to check = $num_files"

# loop over each file to be checked
for file in $(jq  '.[]' /home/runner/files.json | cut -d '"' -f 2); do
    echo "checking file: $file"
    
    # .c files
    if [[ $file == *".c"* ]]; then
        echo "This is a .c file, executing"
        # compile and run. treat warnings as errors
        gcc $file -Werror && ./a.out

    # .py files
    elif [[ $file == *".py"* ]]; then
        echo "This is a .py file, executing"
        # run python file
        python3 $file

    # .js files
    elif [[ $file == *".js"* ]]; then
        echo "This is a .js file, executing"
        # run js file
        node $file

    # .sh files
    # but beware dont execute this script itself if modified otherwise we'll enter endless loop!
    elif [[ "$file" == *".sh"* ]]; then
        if [[ "$file" != *"auto-check-changed-files.sh"* ]]; then
            echo "This is a .sh file, executing"
            chmod +x "$file" # give executable permission
            sh $file
        else
            echo "$file was modified. No need to execute"
        fi

    # file types with no action
    else
        echo "No action needed on this file type!"
    fi

done
