#!/bin/bash
sudo echo "cleaning up guest additions"

apt-get -y --purge remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y clean

sudo echo "cleaning up dhcp leases"
sudo rm /var/lib/dhcp/*

sudo echo "cleaning up udev rules"
sudo rm /etc/udev/rules.d/70-persistent-net.rules
sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
sudo rm -rf /dev/.udev/
sudo rm /lib/udev/rules.d/75-persistent-net-generator.rules

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY