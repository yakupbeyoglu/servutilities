#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi
if [ -n "$1" ]; then 
    echo "Swap area will be $1G"
else
    echo "You must enter an argument as swap size"
    exit 1
fi

echo "Creating swap area please wait"
apt-get update -y

swapon --show
free -h
fallocate -l $1G /swapfile
ls -lh /swapfile
chmod 600 /swapfile
ls -lh /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
free -h
echo "Swap created, starting for permanent creation"
cp /etc/fstab /etc/fstab.ba
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo "Swap area with $1G created succesfully"
exit 0
