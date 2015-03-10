#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
# move any existing dotfiles in homedir to dotfiles_old directory,then create symlinks
for file in {.bash_prompt,.bash_profile,.gitconfig,.gitignore,.screenrc,.tmux.conf,.vim,.vimrc,.exports,.aliases,.functions,.extra}; do
    echo "Creating symlink to $file in home directory."
    ln -s ~/dotfile/$file ~/$file
done
