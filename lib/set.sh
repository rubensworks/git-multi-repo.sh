#!/bin/bash
# Forcefully add the given file or directory in all repos, and stage changes

# Validate input args
if [[ $# -eq 0 ]] ; then
    echo "Error: Missing target file/directory."
    echo "  Usage: gmr set <file-or-directory-name> ... <file-or-directory-name> "
    exit 1
fi

# Check if all targets exists
TMPFILE=$(echo "$(pwd)/.gmr_tmp_set_targets")
rm $TMPFILE 2> /dev/null
touch $TMPFILE
for target in "$@"
do
	if [ ! -d "$target" ] &&  [ ! -f "$target" ]; then
	    echo "The target file or directory '$target' does not exists."
	    exit 1
		rm $TMPFILE
	fi
	
	# Determine absolute path of file/dir
	echo "$(cd "$(dirname "$target")"; pwd -P)/$(basename "$target")" >> .gmr_tmp_set_targets
done

# Add targets to all repos
cat .gmr-config.txt | while read repo
do
   pushd $repo > /dev/null
   
   echo -e "\033[1m\033[34m$(basename $repo)\033[0m"
   
   # Copy all targets
   cat $TMPFILE | while read target; do
       cp -r $target .
   done
   # Stage all targets
   for target in "$@"; do
	   git add $target
   done

   popd > /dev/null
done

rm $TMPFILE
