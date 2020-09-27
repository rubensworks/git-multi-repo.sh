#!/bin/bash
# Show repo status

cat .gmr-config.txt | while read repo 
do
   pushd $repo > /dev/null
   branch=$(git rev-parse --abbrev-ref HEAD)
   unstaged=$([[ ! -z "$(git diff)" ]] && echo -e " - \033[91mUnstaged changes\033[0m" || echo "")
   staged=$([[ ! -z $(git diff --cached) ]] && echo -e " - \033[92mStaged changes\033[0m" || echo "")
   unpushedcommits=$(git log origin/$(git rev-parse --abbrev-ref HEAD)..HEAD --pretty=oneline | wc -l | tr -d ' ')
   if [ "$unpushedcommits" != "0" ]; then
	   unpushedcommits=" - \033[93mPending commits: $unpushedcommits\033[0m"
   else
	   unpushedcommits=""
   fi
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m - $branch$unpushedcommits$staged$unstaged"
   popd > /dev/null
done
