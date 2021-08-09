#!/bin/bash
# Run a custom command in all repos

# Validate input args
if [[ $# -eq 0 ]] ; then
    echo "Error: Missing run parameters."
    echo "  Usage: gmr run some-command"
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
   "$@"

   popd > /dev/null
done
