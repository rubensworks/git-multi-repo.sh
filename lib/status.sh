#!/bin/bash
# Show repo status

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   branch=$(git rev-parse --abbrev-ref HEAD)
   unstaged=$([[ ! -z "$(git diff)" ]] && echo -e "\033[91m- Unstaged changes\033[0m" || echo "")
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m - $branch $unstaged"
   popd > /dev/null
done
