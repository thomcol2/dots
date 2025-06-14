#!/usr/bin/env bash
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

CWD=$(pwd)

if [ $CWD != ".dots" ]; then 
    echo "This script must be run in the '.dots' directory"
    exit 1
fi


# Install arch packages
pacman -S --needed - < $CWD/packages/base_package_list.txt
pacman -S --needed - < $CWD/packages/programming_list.txt
# pacman -S --needed - < $CWD/packages/software_package_list.txt


# Enable and start services
systemctl start bluetooth.service
systemctl enable bluetooth.service


# Install suckless packages
suckless_build() {
    echo "\n##### Building: $1 #####\n"
    cd $CWD/.config/$1
    make clean install || echo "##### $1 build failed #####"
}

suckless_build dwm
suckless_build dwmblocks
suckless_build dmenu
suckless_build st
suckless_build slock


echo "\nGraphics drivers must be installed separately\n"
