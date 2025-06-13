#!/usr/bin/env bash
[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

CWD=$(pwd)

if [ $CWD != ".dots" ]; then 
    echo "This script must be run in the '.dots' directory"
    exit 1
fi


# Install basic arch packages
pacman -S - < $CWD/packages/base_package_list.txt
pacman -S - < $CWD/packages/programming_list.txt
# pacman -S - < $CWD/packages/software_package_list.txt

systemctl start pipewire.service
systemctl start wireplumber.service
systemctl start bluetooth.service
systemctl start iwd.service
systemctl enable pipewire.service
systemctl enable wireplumber.service
systemctl enable bluetooth.service
systemctl enable iwd.service

suckless_build() {
    echo "\n##### Building: $1 #####\n"
    cd $CWD/.config/$1
    make clean install || echo "##### $1 build failed #####"
}

# Install suckless packages
suckless_build dwm
suckless_build dwmblocks
suckless_build dmenu
suckless_build st
suckless_build slock

echo "\nGraphics drivers must be installed separately\n"
