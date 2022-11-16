#!/usr/bin/env bash

apt update
apt install -y python2 python3

update-alternatives --list python || echo "Listed python"
update-alternatives --install /usr/bin/python python /usr/bin/python2 1 || echo "No python2"
update-alternatives --install /usr/bin/python python /usr/bin/python3 2 || echo "No python3"

echo "Installing dependencies"
# These will breakout into their own files soon
# python3-pexpect - Needed by OSSEC
apt install -y python3-pexpect