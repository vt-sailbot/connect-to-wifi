# Kill all existing network interfaces
killall wpa_supplicant
while [1 -eq pidof -s wpa_supplicant]
do
	wait $(pidof -s wpa_supplicant)
done

# Start the network interface specified in network.conf
cp ./network.conf /etc/wpa_supplicant.conf
wpa_supplicant -Dwext -iwlan0 -c /etc/wpa_supplicant.conf -B

echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Get a DHCP lease on the network
dhclient -timeout 10

# Checks connection status
nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
	exit 0
else
	exit 1
fi
