#!/bin/bash
# Fetch changes

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m"
   
   git fetch origin

   popd > /dev/null
done
