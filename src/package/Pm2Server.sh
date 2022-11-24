#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi
echo "Installing PM2 Management system please wait"
apt-get update -y
npm install pm2 -g
exit 0
