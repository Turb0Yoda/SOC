#!/bin/bash
echo "hello"
echo "installing updates"
echo "-------------------------"
sudo dnf update
echo "-------------------------"

echo "-------------------------"
echo "installing pritunl client"
echo "-------------------------"
sudo tee /etc/yum.repos.d/pritunl.repo << EOF
[pritunl]
name=Pritunl Stable Repository
baseurl=https://repo.pritunl.com/stable/yum/fedora/30/
gpgcheck=1
enabled=1
EOF

gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; sudo rpm --import key.tmp; rm -f key.tmp
sudo dnf install pritunl-client-electron
echo "-------------------------"
echo "installing caffeine"
echo "-------------------------"
sudo dnf install caffeine
echo "-------------------------"