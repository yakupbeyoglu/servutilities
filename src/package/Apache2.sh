#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing Apache2"

apt-get update -y && sudo apt -y install apache2
systemctl status apache2
a2enmod rewrite && sudo service apache2 restart
cp ./configs/apache2.conf /etc/apache2/apache2.conf
echo "Apache2 Install process finish"
exit 0
