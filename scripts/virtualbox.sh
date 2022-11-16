#!/bin/sh -eux

OS=$(lsb_release -si)
apt-get update

apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install build-essential debconf-utils dkms linux-image-`uname -r`

mount VBox*.iso -o loop /mnt/ ||echo "No VBoxGuestAdditions.iso"
cd /mnt
/bin/bash VBoxLinuxAdditions.run --nox11 || echo "No VM tools installed"
cd /
umount /mnt || echo "Nothing mounted"
apt clean
