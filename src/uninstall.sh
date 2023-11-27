#!/bin/bash

systemctl stop ozzmaker-gps-i2c
systemctl disable ozzmaker-gps-i2c
systemctl stop gpsd
rm /etc/systemd/system/ozzmaker-gps-i2c.service
rm /etc/systemd/system/gpsd.service
rm /usr/local/bin/ozzmaker-gps-i2c.sh
cp ./gpsd_origial /etc/default/gpsd
systemctl daemon-reload
systemctl start gpsd
printf "\nUninstall Complete, reboot\n"
