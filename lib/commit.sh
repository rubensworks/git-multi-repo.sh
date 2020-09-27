#!/bin/bash
# Creates a commit based on currently stages changes in all repos

# Validate input args
if [[ $# -eq 0 ]] ; then
    echo "Error: Missing commit parameters."
    echo "  Usage: gmr commit -m \"my-commit-message\""
    exit 1
fi

remainingargs=''
for i in "$@"; do 
    case "$i" in  
         *\ * )
		       i="${i//\\/\\\\}"
		       remainingargs="$remainingargs \"${i//\"/\\\"}\""
               ;;
           *)
               remainingargs="$remainingargs $i"
               ;;
    esac
done
#echo $remainingargs

# Commit in all repos
cat .gmr-config.txt | while read repo
do
   pushd $repo > /dev/null
   
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m"
   git commit "$@"

   popd > /dev/null
done
