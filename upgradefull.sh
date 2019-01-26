#!/bin/sh

if [ -z "$STY" ]; then exec screen -dm -S screenName /bin/bash "$0"; 
fi

yay -Syu
sudo snap refresh
sudo flatpak update
yay -Rns $(yay -Qttdq)
sudo paccache -ruk0
sudo paccache -rk2
read -p "Press [Enter] to close"
exit
echo "Full upgrade complete. Enjoy the latest packages!"
