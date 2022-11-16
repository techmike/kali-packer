#!/usr/bin/env bash

sleep 30
/usr/bin/apt-get update
/usr/bin/apt-get -y install python3-pip python3-apt
/usr/bin/pip3 install ansible