#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing PHP please wait"
apt-get update -y
apt install -y software-properties-common apt-transport-https 
add-apt-repository ppa:ondrej/php -y
apt install -y php8.1 libapache2-mod-php8.1 
sudo apt install -y libapache2-mod-php php-mbstring php-mysql php-curl php-xmlrpc php-soap php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear
echo "php8.1 installed, resetting apache2 server"
systemctl restart apache2
systemctl status apache2 --no-pager

echo "Installing composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
ls /usr/local/bin/
echo "Composer installed"
exit 0
