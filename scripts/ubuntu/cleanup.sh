sudo apt-get -y autoremove
sudo apt-get -y clean

sudo echo "cleaning up guest additions"
sudo rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

sudo echo "cleaning up dhcp leases"
sudo rm /var/lib/dhcp/*

sudo echo "cleaning up udev rules"
sudo rm /etc/udev/rules.d/70-persistent-net.rules
sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
sudo rm -rf /dev/.udev/
sudo rm /lib/udev/rules.d/75-persistent-net-generator.rules