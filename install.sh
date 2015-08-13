#!/bin/bash
set -e
source /tmp/build/buildconfig
set -x

sed -i 's/^\(deb.*\)http:\/\/archive\.ubuntu\.com\(.*\)$/\1http:\/\/ubuntu.stu.edu.tw\2/g' /etc/apt/sources.list
apt-get update
apt-get dist-upgrade -y
echo "Asia/Taipei" > /etc/timezone
cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime
apt-get autoremove -y
workaround-pam build

apt-get clean
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
rm -f /etc/ssh/ssh_host_*
