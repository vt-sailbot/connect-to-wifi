#!/bin/bash

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
wpa_passphrase $ssid $passphrase >> ./network.conf

# Move network config
cp ./network.conf /etc/wpa_supplicant.conf

# Enable systemd service
systemctl enable connect-to-wifi.service > /dev/null
