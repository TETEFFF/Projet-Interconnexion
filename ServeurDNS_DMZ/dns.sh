ip route del default via 120.0.174.1
ip route add default via 120.0.174.4

named -g -c /etc/bind/named.conf