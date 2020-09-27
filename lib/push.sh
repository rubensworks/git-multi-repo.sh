#!/bin/bash
# Push changes

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m"
   git push "$@" origin $(git rev-parse --abbrev-ref HEAD)

   popd > /dev/null
done
