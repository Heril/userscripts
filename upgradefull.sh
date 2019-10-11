#!/bin/sh

if [ -z "$STY" ]; then exec screen -dm -S screenName /bin/bash "$0"; 
fi

yay -Syu
sudo snap refresh
sudo flatpak update
yay -Rns $(yay -Qttdq)

set -eu

snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

sudo paccache -ruk0
sudo paccache -rk2

sudo journalctl --vacuum-files=1

read -p "Press [Enter] to close"
exit
echo "Full upgrade complete. Enjoy the latest packages!"
