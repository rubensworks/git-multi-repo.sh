#!/bin/bash
# Pull changes

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m"

   if [[ $(git diff) ]]; then
       echo "Error: Unstaged files were detected in $repo (run 'gmr status' to check which repos have unstaged changes)."
       git status
	   popd > /dev/null
       exit 1
   fi
   
   git pull origin $(git rev-parse --abbrev-ref HEAD)

   popd > /dev/null
done
