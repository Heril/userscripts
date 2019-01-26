#!/bin/sh

if [ -z "$STY" ]; then exec screen -dm -S screenName /bin/bash "$0"; 
fi

if [[ $(pacman -Qu linux nvidia wireguard-arch) ]]; then
  pacman -Syu --ignore linux --ignore linux-headers --ignore nvidia #--ignore wireguard-arch
  sudo snap refresh
  sudo flatpak update
  yay -Rns $(yay -Qttdq)
  sudo paccache -ruk0
  exit
  echo "Partial upgrade complete. Prepare to restart computer and then run upgradefull.sh"
else
  yay -Syu
  sudo snap refresh
  sudo flatpak update
  yay -Rns $(yay -Qttdq)
  sudo paccache -ruk0
  sudo paccache -rk2
  exit
  echo "Full upgrade complete. Enjoy the latest packages!"
fi
