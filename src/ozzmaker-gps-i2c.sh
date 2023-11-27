#!/bin/bash
clear
usage() {
    echo "Usage: ./ozzmaker-gps-i2c.sh {start|stop|restart}"
    exit 1
}

# Check the number of arguments
if [ "$#" -ne 1 ]; then
    usage
fi

Fn=$1
printf "Executing: $Fn\n"

if [ "$#" -ne 1 ]; then
	alert "$Usage"
fi

#Shut everything down 
if [ "$Fn" == "stop" ] || [ "$Fn" == "restart" ]; then
	printf "Stopping...\n"
	rm -f /tmp/gps
fi

if [ "$Fn" == "start" ] || [ "$Fn" == "restart" ]; then
        printf "Starting...\n"
	mknod /tmp/gps p
	stdbuf -oL /usr/bin/python3 /usr/local/bin/ozzmaker-gps-i2c.py > /tmp/gps
fi
