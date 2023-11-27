#!/bin/bash
cp ./ozzmaker-gps-i2c.service /etc/systemd/system/
cp ./gpsd.service ./etc/systemd/system/
cp ./ozzmaker-gps-i2c.sh /usr/local/bin/
cp /etc/default/gpsd ./gpsd_original
cp ./gpsd /etc/default/gpsd
chmod +x /usr/local/bin/ozzmaker-gps-i2c.sh
systemctl daemon-reload
systemctl enable ozzmaker-gps-i2c
printf "\nInstall Complete, reboot and verify that gpsmon and/or cgps function properly\n"
