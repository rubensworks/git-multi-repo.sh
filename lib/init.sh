#!/bin/bash
# Initialize a gmr environment

# Validate input args
if [[ $# -ne 1 ]] ; then
    echo "Error: Missing experiment name."
    echo "  Usage: gmr init <directory-name>"
    exit 1
fi
name=$1

# Make sure the target dir does not exist yet
dir="$(pwd)/$name"
if [ -d "$dir" ]; then
    echo "The target directory '$dir' already exists."
    exit 1
fi

# Copy the template folder
mkdir $dir
touch $dir/.gmr-config.txt
