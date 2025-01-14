#!/bin/sh

# Assign IP addresses to interfaces
# ip addr add 120.0.160.5/21 dev eth1
# ip addr add 120.0.174.2/23 dev eth2

# Bring interfaces up
# ip link set eth1 up
# ip link set eth2 up

# Add IP routes
# ip route add 120.0.168.0/22 via 120.0.160.2 # entreprise
# ip route add 120.0.174.0/24 via 120.0.160.4 # DMZ
# ip route add {not provided by the boys} via 120.0.160.6 
# ip route add 120.0.176.0/20 via 120.0.160.3 # AS11
# ip route add 120.0.144.0/20 via 120.0.160.3 # AS9

# ip route add 192.168.1.0/24 via 120.0.172.3  


# Keep the container running
# tail -f /dev/null

#_______________Dynamic_Routing_______________

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Start FRRouting services using OpenRC
ulimit -n 100000
/usr/lib/frr/frrinit.sh start
# /usr/lib/frr/frrinit.sh --limit-fds=100000 start

# Keep the container running for debugging/logging purposes
tail -f /dev/null