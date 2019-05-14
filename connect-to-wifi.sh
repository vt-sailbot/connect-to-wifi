#!/bin/bash
# Built for Debian 9 (Stretch)

# Kill all existing network interfaces
killall wpa_supplicant
while [1 -eq pidof -s wpa_supplicant]
do
	wait $(pidof -s wpa_supplicant)
done
echo "wpa_supplicants dead"

# Start the network interface specified in network.conf
echo $(wpa_supplicant -iwlan0 -c/etc/wpa_supplicant.conf -B -d)

echo "nameserver 8.8.8.8" >> /etc/resolvconf/run/resolv.conf

# Get a DHCP lease on the network
dhclient

# Checks connection status
nc -z 8.8.8.8 53 > /dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
	exit 0
else
	exit 1
fi
