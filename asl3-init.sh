#!/usr/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y
apt install -y wget
wget https://repo.allstarlink.org/public/asl-apt-repos.deb12_all.deb
dpkg -i asl-apt-repos.deb12_all.deb
apt update
apt install -y asl3-asterisk dahdi-dkms


