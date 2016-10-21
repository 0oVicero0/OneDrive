#!/bin/bash

ERROR_CODE1=0
ERROR_CODE2=0
ERROR_CODE3=0
ERROR_CODE4=0
ERROR_CODE5=0

function ERROR() {
[ "$ERROR_CODE1|$ERROR_CODE2|$ERROR_CODE3$ERROR_CODE4|$ERROR_CODE5" ] || {
echo "Install error! "
}}

function Install() {
REPATH=$(pwd)
rm -rf /usr/local/etc/OneDrive/$TYPE
mkdir -p /usr/local/etc/OneDrive/$TYPE
cd /usr/local/etc/OneDrive/$TYPE
wget --no-check-certificate -q -O json-parser https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/json-parser && ERROR_CODE1=1
wget --no-check-certificate -q -O onedrive https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive && ERROR_CODE2=1
wget --no-check-certificate -q -O onedrive-authorize https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive-authorize && ERROR_CODE3=1
wget --no-check-certificate -q -O onedrive-base https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive-base && ERROR_CODE4=1
wget --no-check-certificate -q -O onedrive.cfg https://raw.githubusercontent.com/0oVicero0/OneDrive/master/$TYPE/onedrive.cfg && ERROR_CODE5=1
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

