#!/bin/bash
set -e

# update pacman mirrorlist, US, ip 4, status on
# get the mirrors
wget -O ~/newmirrors "https://www.archlinux.org/mirrorlist/?country=US&protocol=http&protocol=https&ip_version=4&use_mirror_status=on"

list=~/newmirrors

# uncomment mirrors
vim -c "%s/\#S/S" $list +wqall

# rank and save the mirrors 
sudo -s <<EOF
echo 'ranking mirrors...'
rankmirrors -n 10 -v $list > /etc/pacman.d/mirrorlist
echo 'refreshing keys'
pacman-key --refresh
echo 'syncing the databases'
pacman -Syy
EOF

# delete the list
rm $list
echo 'mirrorlist removed, update complete.'
