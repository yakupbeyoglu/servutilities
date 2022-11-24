#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing Latest version ofRedis please wait"

add-apt-repository ppa:redislabs/redis -y
apt-get update -y
apt-get install redis -y

if [ -n "$1" ]; then 
    echo "password will set as $1"
    echo "requirepass $1" >> /etc/redis/redis.conf
fi

redis-cli --version
echo "Restarting redis server"
service redis-server restart
echo "Finish"
exit 0
