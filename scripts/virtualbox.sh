#!/bin/sh -eux

OS=$(lsb_release -si)
apt-get update
echo `uname -r`

apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install dkms build-essential
apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install linux-image-4.19.0-kali5-amd64 linux-headers-4.19.0-kali5-amd64
#apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install virtualbox-guest-x11 virtualbox-guest-utils virtualbox-guest-dkms

updatedb || echo "updatedb not installed"
locate VBoxLinuxAdditions.run || echo "locate not intalled"
locate VBoxGuestAdditions.iso || echo "locate not intalled"
mount /root/VBoxGuestAdditions*.iso -o loop /mnt/ || mount /VBoxGuestAdditions*.iso -o loop /mnt/ || mount /home/vagrant/VBoxGuestAdditions*.iso -o loop /mnt/ || mount /root/VBoxGuestAdditions*.iso -o loop /mnt/ || mount /VBoxGuestAdditions.iso -o loop /mnt/ || mount VBox*.iso -o loop /mnt/ || mount /VBox*.iso -o loop /mnt/ || mount /home/vagrant/VBox*.iso -o loop /mnt/ ||echo "No VBoxGuestAdditions.iso"
cd /mnt
/bin/bash VBoxLinuxAdditions.run --nox11 || echo "No VM tools installed"
cd /
umount /mnt || echo "Nothing mounted"
apt clean
