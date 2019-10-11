#!/bin/bash
TODAY=`date +"%F"`
NOW=`date +"%T"`
ALL=`pacman -Q | wc -l`
EALL=`pacman -Qe | wc -l`
CORE=`comm -12 <(pacman -Qq | sort) <(pacman -Slq core | sort) | wc -l`
ECORE=`comm -12 <(pacman -Qeq | sort) <(pacman -Slq core | sort) | wc -l`
EXTRA=`comm -12 <(pacman -Qq | sort) <(pacman -Slq extra | sort) | wc -l`
EEXTRA=`comm -12 <(pacman -Qeq | sort) <(pacman -Slq extra | sort) | wc -l`
COMMUNITY=`comm -12 <(pacman -Qq | sort) <(pacman -Slq community | sort) | wc -l`
ECOMMUNITY=`comm -12 <(pacman -Qeq | sort) <(pacman -Slq community | sort) | wc -l`
MULTILIB=`comm -12 <(pacman -Qq | sort) <(pacman -Slq multilib | sort) | wc -l`
EMULTILIB=`comm -12 <(pacman -Qeq | sort) <(pacman -Slq multilib | sort) | wc -l`
AUR=`pacman -Qm | wc -l`
EAUR=`pacman -Qem | wc -l`

echo $TODAY, $NOW, $ALL, $EALL, $CORE, $ECORE, $EXTRA, $EEXTRA, $COMMUNITY, $ECOMMUNITY, $MULTILIB, $EMULTILIB, $AUR, $EAUR >> ~/packagedata.txt
