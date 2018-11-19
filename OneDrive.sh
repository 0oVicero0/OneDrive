#!/bin/bash

[ -d /usr/local/etc/OneDrive ] && mv -f /usr/local/etc/OneDrive /usr/local/etc/OneDrive.bak
mkdir -p /usr/local/etc/OneDrive
cd /usr/local/etc/OneDrive
wget --no-check-certificate -q -O json-parser "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/json-parser"
wget --no-check-certificate -q -O onedrive "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/onedrive"
wget --no-check-certificate -q -O onedrive-d "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/onedrive-d"
wget --no-check-certificate -q -O onedrive-authorize "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/onedrive-authorize"
wget --no-check-certificate -q -O onedrive-base "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/onedrive-base"
wget --no-check-certificate -q -O onedrive.cfg "https://raw.githubusercontent.com/0oVicero0/OneDrive/master/Business/onedrive.cfg"
chmod -R a+x /usr/local/etc/OneDrive
ln -sf /usr/local/etc/OneDrive/onedrive /usr/local/bin/
ln -sf /usr/local/etc/OneDrive/onedrive-d /usr/local/bin/
[ -d /usr/local/etc/OneDrive.bak ] && {
[ -f /usr/local/etc/OneDrive.bak/onedrive.cfg ] && cp -rf /usr/local/etc/OneDrive.bak/onedrive.cfg /usr/local/etc/OneDrive/
[ -f /usr/local/etc/OneDrive.bak/.refresh_token ] && cp -rf /usr/local/etc/OneDrive.bak/.refresh_token /usr/local/etc/OneDrive/
rm -rf /usr/local/etc/OneDrive.bak
}

rm -rf $(basename "$0")
