#!/bin/sh

# supprimer route par défaut de docker
ip route del default via 192.168.2.1
# route par défaut
ip route add default via 192.168.2.2

# Keep the container running
tail -f /dev/null