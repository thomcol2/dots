#!/usr/bin/env bash

recursive_link() {
    for file in $(ls $1)
    do
        ln -s "$1/$file" "$2"
    done
}

# It is assumed that the user has already installed git
git clone https://github.com/thomcol2/dots ~/.dots

mkdir ~/.config
mkdir ~/scripts

recursive_link ~/dots/.config ~/practice
recursive_link ~/dots/scripts ~/scripts
recursive_link ~/dots ~
