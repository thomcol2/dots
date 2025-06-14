#!/usr/bin/env bash

CWD=$(pwd)

[[ $CWD != "/home/thomcol/.dots" ]] && 
    echo "##### script CWD must be '.dots' #####" && 
    exit 1


# Install arch packages
sudo pacman -S --needed xorg-server xorg-apps xorg-xinit
sudo pacman -S --needed - < $CWD/packages/base_list.txt
sudo pacman -S --needed - < $CWD/packages/programming_list.txt
# sudo pacman -S --needed - < $CWD/packages/software_package_list.txt


# Enable and start services
sudo systemctl start bluetooth.service && sudo systemctl enable bluetooth.service


# Install suckless packages
suckless_build() {
    echo -e "\n\033[1m##### building $1 #####\033[0m"
    cd $CWD/.config/$1
    sudo make install clean || echo -e "\n\033[1m##### $1 build failed #####\033[0m"
}

suckless_build dwm
suckless_build dwmblocks
suckless_build dmenu
suckless_build st
suckless_build slock


# Set background (breaks dmenu if not present)
FOLDER=~/wallpapers
SCRIPT=~/scripts/pywal.sh

CHOICE=$(nsxiv -o -t $FOLDER)
case $CHOICE in
    *.*)
        feh --bg-fill $CHOICE
        wal -i $CHOICE -n -o $SCRIPT ;;
    *) ;;
esac


echo -e "\n\033[1m##### graphics drivers must be installed separately #####\033[0m"
