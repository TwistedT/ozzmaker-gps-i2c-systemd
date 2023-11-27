#!/bin/bash

clear
test=0
trap "exit 1" TERM
TOP_PID=$$

function alert()
{
   echo "$1"
   kill -s TERM $TOP_PID
}

Usage="
Usage: ./start_gps.sh [start] [stop] [restart]
"

Fn=$1
printf "Executing: $Fn\n"

#Shut everything down 
if [ "$Fn" == "stop" ]; then
	rm -f /tmp/gps
fi

if [ "$Fn" == "serial" ]; then
        mknod /tmp/gps p
        stdbuf -oL /usr/bin/python3 /usr/local/bin/ozzmaker-gps-i2c.py > /tmp/gps &
fi

if [ "$Fn" == "restart" ]; then
	sudo ls -al /tmp/gps*
	sudo ls -al /run/gps*
	sudo netstat -l | grep gps
	sudo systemctl list-sockets | grep gps
	cat /etc/default/gpsd | grep DEVICES
fi

if [ "$Fn" == "start" ]; then
        mknod /tmp/gps p
	#/bin/bash stdbuf -oL python i2c-gps.py > /tmp/gps
	stdbuf -oL /usr/bin/python3 /usr/local/bin/ozzmaker-gps-i2c.py > /tmp/gps
	#sudo gpsd -N -D3 -F /tmp/gps
	#sudo gpsd -N -D3 -F -n /tmp/gps
fi

#exit 0
#Start
#/tmp/gps p stdbuf -oL python i2c-gps.py > /tmp/gps &
##gpsd -N -D3 -F @RUNDIR/gpsd.sock /tmp/gps
#sudo gpsd -N -D3 -F /tmp/gps
