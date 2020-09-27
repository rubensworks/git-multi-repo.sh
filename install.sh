#!/bin/bash
# Installs the Got Multi Repo tool

if [ ! -d "$HOME/.gmr" ]; then
    echo "Installing Git Multi Repo"
    git clone --depth=1 --recursive https://github.com/rubensworks/git-multi-repo.sh.git "$HOME/.gmr"
    dir="$HOME/.gmr"
    echo "export PATH=\"$dir/bin:\$PATH\"" >> ~/.bashrc
else
    echo "Git Multi Repo is already installed at $HOME/.gmr"
fi

