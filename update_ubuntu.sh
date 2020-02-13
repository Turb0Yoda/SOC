#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "SOC Setting up Script"
echo "Yes this the the best name I can think of"

sleep 1

echo "Updating Ubuntu"

sleep 1

#update ubuntu
apt update
apt upgrade

echo "Installing programs"

sleep 1

sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt bionic main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron

apt install caffeine
apt install git
apt install wget
