#!/bin/bash
# Push changes

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   
   echo "$(basename $repo)"
   git push origin $(git rev-parse --abbrev-ref HEAD)

   popd > /dev/null
done
