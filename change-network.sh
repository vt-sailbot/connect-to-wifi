#!/bin/bash

echo "WARNING: This script will overwrite network.conf. Save the changes elsewhere if you wish to keep them."
echo "Enter new network name (SSID): "
read ssid
echo "Enter new network passphrase: "
read passphrase
wpa_passphrase $ssid $passphrase >> ./network.conf

# Restart Wi-Fi service
systemctl reboot connect-to-wifi.service > /dev/null
