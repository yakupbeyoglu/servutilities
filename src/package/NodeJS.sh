#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing Node js 18.x  please wait"
apt-get update -y && apt-get -y install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install v16.17.1 -y
node -v
echo "Node js installed successfully"
exit 0
