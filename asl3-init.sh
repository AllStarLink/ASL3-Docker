#!/usr/bin/bash

export DEBIAN_FRONTEND=noninteractive

# install the repo
apt update
apt upgrade -y
apt install -y wget
wget https://repo.allstarlink.org/public/asl-apt-repos.deb12_all.deb
dpkg -i asl-apt-repos.deb12_all.deb
apt update

# install kernel headers in preparation
apt install -y linux-headers-$(uname -r)

# prep /etc/asterisk
if [ ! -f /etc/asterisk/asterisk.conf ]; then
	rm -rf /etc/asterisk/*
fi
chown asterisk:asterisk /etc/asterisk

# install
apt install -y asl3 
