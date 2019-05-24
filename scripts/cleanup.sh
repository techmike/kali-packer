#!/bin/sh -eux

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf;

apt-get -y autoremove
apt-get -y clean

echo "cleaning up guest additions"
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/* || echo "There is not dhcp"

echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules || echo "There is no udev rules"
mkdir /etc/udev/rules.d/70-persistent-net.rules || echo "Udev dir already created"
rm -rf /dev/.udev/ || echo "No udev dir to delete"
rm /lib/udev/rules.d/75-persistent-net-generator.rules || echo "No udev dir to delete"
rm -rf  /etc/udev/rules.d/70-persistent-net.rules || echo "There is no udev rules"

