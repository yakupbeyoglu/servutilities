#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing PHP please wait"
apt-get update -y
apt install software-properties-common apt-transport-https -y
add-apt-repository ppa:ondrej/php -y
apt install php8.1 libapache2-mod-php8.1
echo "php8.1 installed, resetting apache2 server"
systemctl restart apache2
systemctl status apache2
