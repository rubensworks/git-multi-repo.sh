#!/bin/bash
# Show repo status

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   branch=$(git rev-parse --abbrev-ref HEAD)
   unstaged=$([[ ! -z "$(git diff)" ]] && echo "- Unstaged changes" || echo "")
   echo "$(basename $repo) - $branch $unstaged"
   popd > /dev/null
done
