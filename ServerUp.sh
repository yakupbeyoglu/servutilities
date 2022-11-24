#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Server packages installing please wait"
chmod +x ./src/*
ls -la ./src/
./src/CreateSwap.sh $1
./src/RedisCreator  $2
find src/package -name "*.sh" -exec {} \;
