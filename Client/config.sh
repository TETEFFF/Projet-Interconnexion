#!/bin/sh

sleep 2

# Assign IP addresses to interfaces
ip addr add 192.168.2.3/24 dev eth0

# Bring interfaces up
ip link set eth0 up


# Keep the container running
tail -f /dev/null
