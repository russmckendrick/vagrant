if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
yum -y install bzip2 wget perl gcc kernel-devel kernel-headers
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso
fi

if [[ $PACKER_BUILDER_TYPE =~ vmware ]]; then
yum -y install bzip2 wget perl gcc kernel-devel kernel-headers psmisc fuse fuse-libs fuse-devel
mkdir /mnt/cdrom
mount -o loop /home/vagrant/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp
cd /tmp/vmware-tools-distrib
/tmp/vmware-tools-distrib/vmware-install.pl -d
umount /mnt/cdrom
rm -rf /tmp/vmware-tools-distrib
rm -rf /home/vagrant/linux.iso
fi
