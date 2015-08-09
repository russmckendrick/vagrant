#!/bin/bash
apt-get -y install --no-install-recommends libdbus-1-3
aptitude -y install dkms
/etc/init.d/virtualbox-ose-guest-utils stop
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
aptitude -y install dkms
mount -o loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt
sudo rm -rf VBoxGuestAdditions.iso