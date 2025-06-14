#!/usr/bin/env bash

recursive_link() {
    for file in $(ls -a $1)
    do
        ln -s "$1/$file" "$2"
    done
}

# It is assumed that the user has already installed git and run the command 
# 'git clone https://github.com/thomcol2/dots ~/.dots'

mkdir ~/.config || echo "##### directory '.config' already exists #####"

recursive_link ~/.dots/.config ~/.config
recursive_link ~/.dots/home ~
ln -s ~/.dots/wallpapers ~
ln -s ~/.dots/scripts ~
