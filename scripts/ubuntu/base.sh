#!/bin/bash
apt-get -y update
apt-get -y install vim git
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
echo 'UseDNS no' >> /etc/ssh/sshd_config
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF
update-grub