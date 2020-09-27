#!/bin/bash
# Pull changes

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null

   if [[ $(git diff) ]]; then
       echo "Error: Unstaged files were detected in $repo (run 'gmr status' to check which repos have unstaged changes)."
       git status
	   popd > /dev/null
       exit 1
   fi
   
   git pull origin $(git rev-parse --abbrev-ref HEAD)

   popd > /dev/null
done
