#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
find . -maxdepth 1 -name ".*" | while read -r file;
do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
