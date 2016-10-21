#!/bin/bash

function Install() {
REPATH=$(pwd)
rm -rf /usr/local/etc/OneDrive/$TYPE
mkdir -p /usr/local/etc/OneDrive/$TYPE
cd /usr/local/etc/OneDrive/$TYPE
wget --no-check-certificate -q -O json-parser https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/json-parser
wget --no-check-certificate -q -O onedrive https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive
wget --no-check-certificate -q -O onedrive-authorize https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive-authorize
wget --no-check-certificate -q -O onedrive-base https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive-base
wget --no-check-certificate -q -O onedrive.cfg https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive.cfg
chmod -R +x /usr/local/etc/OneDrive/$TYPE
ln -sf /usr/local/etc/OneDrive/$TYPE/onedrive /usr/local/bin
cd $REPATH
}

if [[ "$1" == 'business' ]]; then
TYPE='Business'
Install;
elif [[ "$1" == 'personal' ]]; then
TYPE='Personal'
Install;
else
echo "bash $0 [personal|business]";
fi

