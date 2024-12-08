#!/bin/sh

# Assign IP addresses to interfaces
#ip addr add 120.0.160.2/21 dev eth1  
#ip addr add 120.0.168.1/22 dev eth2

# Bring interfaces up
#ip link set eth1 up
#ip link set eth2 up


# Add IP routes
ip route add 120.0.174.0/24 via 120.0.160.4 # DMZ
ip route add 120.0.172.0/23 via 120.0.160.5 # Clients
# ip route add {not provided by the boys} via 120.0.160.6 
ip route add 120.0.176.0/20 via 120.0.160.3 # AS11
ip route add 120.0.144.0/20 via 120.0.160.3 # AS9

ip route add 192.168.1.0/24 via 120.0.168.2  # Box


# Keep the container running
tail -f /dev/null
