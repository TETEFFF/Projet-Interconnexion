#!/bin/sh

# Assign IP addresses to interfaces
ip addr add 192.168.3.5/24 dev eth0
ip addr add 120.0.168.3/22 dev eth1
# Bring interfaces up
ip link set eth0 up
ip link set eth1 up


#service isc-dhcp-server start

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
# Bloquer toutes les requêtes sauf celles filtrées
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# Accepter Ping
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A FORWARD -p icmp -j ACCEPT

# Accepter DHCP
iptables  -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT
# Accpeter DNS
iptables -t filter -A FORWARD -d 120.0.168.5/22 -p udp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.168.5/23 -p udp --sport 53 -j ACCEPT
# Accpeter HTTP
iptables -t filter -A FORWARD -d 120.0.168.4/22 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.168.4/22 -p tcp --sport 80 -j ACCEPT

# Keep the container running
tail -f /dev/null
