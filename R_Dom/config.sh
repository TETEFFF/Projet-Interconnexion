#!/bin/sh

# Assign IP addresses to interfaces
ip addr add 192.168.2.1/24 dev eth0
ip addr add 120.0.172.3/23 dev eth1
# Bring interfaces up
ip link set eth0 up
ip link set eth1 up

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
# Bloquer toutes les requêtes sauf celles filtrées
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# Accepter Ping
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A FORWARD -p icmp -j ACCEPT

# Keep the container running
tail -f /dev/null
