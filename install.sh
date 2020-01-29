#!/bin/bash
# Built for Debian 9 (Stretch)

# Install service
mkdir -p /opt/connect-to-wifi
cp -f connect-to-wifi.sh /opt/connect-to-wifi/connect-to-wifi.sh

# Install service to run at boot
cp -f connect-to-wifi.service /lib/systemd/system/connect-to-wifi.service

# Get network details
echo "WARNING: The install script will overwrite network.conf. Save the changes elsewhere if you wish to keep them."
echo "To change the network details later, use change-network.sh"
echo "Enter network name (SSID): "
read ssid
echo "Enter network passphrase: "
read passphrase

# write to network config
rm ./network.conf
touch ./network.conf
echo "auto wlan0" >> ./network.conf
echo "iface wlan0 inet dhcp" >> ./network.conf
echo "  wpa-ssid" $ssid >> ./network.conf
echo "  wpa-psk " $passphrase >> ./network.conf

# move to interfaces
cat network.conf >> /etc/network/interfaces

# add nameserver
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Enable systemd service
systemctl enable connect-to-wifi.service > /dev/null
