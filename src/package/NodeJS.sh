#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing Node js 18.x  please wait"
apt-get update -y && apt-get -y install curl
curl -sL https://deb.nodesource.com/setup_18.x | -E bash -
apt install nodejs 
node -v
echo "Node js installed successfully"
exit 0
