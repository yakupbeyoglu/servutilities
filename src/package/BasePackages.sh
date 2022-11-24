#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi
echo "Installing Base packages please wait"
apt-get update -y
apt-get -y install build-essential
apt-get -y install curl openssl libssl-dev
exit 0
