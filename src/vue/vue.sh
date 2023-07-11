#!/bin/bash

if [[ $(id -u) != 0 ]] ; then
    echo "Must be run as root" >&2
    exit 1
fi

echo "Installing vue js"
npm install vue@^2
echo "Vue js installed"