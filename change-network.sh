#!/bin/bash

echo "WARNING: This script will overwrite network.conf. Save the changes elsewhere if you wish to keep them.\n\n"
echo "Enter new network name (SSID): "
read ssid
wpa_supplicant $ssid >> ./network.conf

# Restart Wi-Fi service
systemctl reboot connect-to-wifi.service > /dev/null
