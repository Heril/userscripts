# userscripts
Collection of useful personal user scripts

This is a small collection of shell scripts written to make my life just a little bit easier in maintaining my Arch Linux system

## dockercompose.sh
Runs local `docker-compose` in a `screen` instance.

## packagecount.sh
Generates a total number of packages installed for an Arch based system. For each count, the total number is given followed by the number of explicitly installed packages in that group:

```
<date> <time> <# all packages> <# core packages> <# extra packages> <# community packages>...
...<# multilib packages> <# packages from AUR>
```

The results then get appended to `~/packagedata.txt`

## passwordgen.sh
Generates an alpha-numeric password that is 32 characters long and outputs it to the terminal.

## plasma.sh
Kills and then starts a KDE Plasma session, because I keep forgetting how to do it, so instead of searching every time I do this.

## upgradefull.sh
Principle system maintenance script that handles a total system upgrade, as well as related maintenance. Since I've had one too many difficulties with updates in a terminal emulator where my DE crashed, I run the script within a `screen` instance. It does the following:
- Using `yay` it does a full system upgrade
- Updates snaps using `snap refresh`
- Updates flatpaks with `flatpak update`
- Removes system packages with orphaned dependencies
- Removes old versions of snaps
- Clears out `/var/cache/pacman/pkg` of all files for
	- System packages no longer installed
	- All but the latest 2 versions of all other system packages
- Vacuums `journalctl`

## upgrade
A wrapper script, to run `upgradefull.sh` as well as enter the `screen` instance.
