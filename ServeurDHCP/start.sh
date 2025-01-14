#!/bin/bash
touch /var/lib/dhcp/dhcpd.leases
dhcpd
# Start the DHCP server
service isc-dhcp-server start

# Keep the container running
tail -f /dev/null