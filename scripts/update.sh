#!/bin/sh -eux

arch="`uname -r | sed 's/^.*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}\(-[0-9]\{1,2\}\)-//'`"

apt-get update;

rm -rf  /etc/udev/rules.d/70-persistent-net.rules || echo "There is no udev rules"

# Install software
DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential debconf-utils -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"

#Update packages
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
