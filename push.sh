#!/bin/bash

declare -a file

for arg in "$@"; do
    file+=($arg)
done


git add ${file[*]}

read -p 'Your commit message: ' commitMessage

git commit -m "$commitMessage"

read -p 'Are you sure that you wanna push ${file[*]}': response