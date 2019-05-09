# `connect-to-wifi`

> `connect-to-wifi` is a systemd service that automatically connects the Beaglebone Black to a Wi-Fi network. It runs at boot and continually attempts to connect to the currently configured network until it successfully acquires a DHCP lease.

### Install
Run `install.sh` with `bash`. You will prompted for the network name (SSID) and password (if there is one).

### Change Network
To connect to a different network than the one in the configuration, run `change-network.sh` with `bash`. You will prompted for the network name (SSID) and password (if there is one).

### Development

See the [systemd man pages](http://man7.org/linux/man-pages/man1/systemd.1.html) for information on writing various parts of the service file. Descriptions for relevant sections are on separate pages (e.g. configuration of the `[Unit]` section is on the [`systemd.unit` page](http://man7.org/linux/man-pages/man5/systemd.unit.5.html).
