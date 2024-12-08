
#!/bin/sh

# Assign IP addresses to interfaces
ip addr add 198.168.1.9/24 dev eth1
# Adresse associée à eth2 à la charge de l'AS 11

# Bring interfaces up
ip link set eth1 up
# ip link set eth2 up

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
