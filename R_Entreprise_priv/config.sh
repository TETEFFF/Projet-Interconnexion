#!/bin/sh

# Configuration des routes
ip route add 120.0.168.0/22 via 120.0.168.3 # Entreprise_Prim
ip route add 192.168.3.0/24 via 192.168.3.5 # Entreprise_Priv
ip route add 120.0.160.0/21 via 120.0.168.2 # Reseau coeur
ip route add 120.0.172.0/23 via 120.0.168.2 # Clients

# Assignation des IP aux interfaces
ip addr add 192.168.3.5/24 dev eth0
ip addr add 120.0.168.3/22 dev eth1
ip link set eth0 up
ip link set eth1 up

# Activer le NAT (Masquerading)
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

# Politique par défaut restrictive
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Autoriser le ping (ICMP)
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
iptables -t filter -A FORWARD -p icmp -j ACCEPT

# Autoriser DHCP sur eth0 (privé)
iptables -t filter -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT
iptables -t filter -A OUTPUT -o eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Autoriser DNS (UDP/TCP sur port 53)
iptables -t filter -A FORWARD -i eth0 -o eth1 -p udp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -p udp --sport 53 -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth1 -p tcp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -p tcp --sport 53 -j ACCEPT

# Accepter DNS
iptables -t filter -A FORWARD -d 120.0.168.5/22 -p udp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.168.5/22 -p udp --sport 53 -j ACCEPT
iptables -t filter -A FORWARD -d 120.0.168.5/22 -p tcp --dport 53 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.168.5/22 -p tcp --sport 53 -j ACCEPT


# Autoriser HTTP/HTTPS (ports 80 et 443)
iptables -t filter -A FORWARD -i eth0 -o eth1 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -p tcp --sport 80 -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth1 -p tcp --dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -p tcp --sport 443 -j ACCEPT

# Accpeter HTTP
iptables -t filter -A FORWARD -d 120.0.168.4/22 -p tcp --dport 80 -j ACCEPT
iptables -t filter -A FORWARD -s 120.0.168.4/22 -p tcp --sport 80 -j ACCEPT

# Autoriser le trafic local (loopback)
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# Garder le conteneur en exécution
tail -f /dev/null
