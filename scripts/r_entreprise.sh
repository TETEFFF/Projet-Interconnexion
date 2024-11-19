#!/bin/sh

sleep 1

# Assign IP addresses to interfaces
ip addr add 192.168.1.1/24 dev eth0  
ip addr add 192.168.2.1/24 dev eth1

# Bring interfaces up
#ip link set eth0 up
#ip link set eth1 up


# Keep the container running
tail -f /dev/null
