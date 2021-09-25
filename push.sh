#!/bin/bash

declare -a file

for arg in "$@"; do
    file+=($arg)
done


git add ${file[*]}

read -p 'Your commit message: ' commitMessage

git commit -m "$commitMessage"

read -p "Are you sure that you wanna push ${file[*]}": response


if [[ $response == "y" ]] || [[ $response == "Yes" ]] || [[$response == "yes"]]; then
    git push
    echo ${file[*]} "have been pushed"
else
    git rm --cache ${file[*]}
    echo "Commit have been deleted. If you wanna push. Restart script with files that you want push in argument"
    