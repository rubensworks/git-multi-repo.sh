#!/bin/bash
# Add a repo

# Validate input args
if [[ $# -ne 1 ]] ; then
    echo "Error: Missing git directory name."
    echo "  Usage: gmr add <directory-name>"
    exit 1
fi
dir=$1

# Make sure the target dir is a git repo
dir="$(cd $dir/; pwd)"
if [ ! -d "$dir" ]; then
    echo "The target directory '$dir' does not exists."
    exit 1
fi
if [ ! -d "$dir/.git" ]; then
    echo "The target directory '$dir' is not a git repository."
    exit 1
fi

# Append directory into config
echo $dir >> .gmr-config.txt
