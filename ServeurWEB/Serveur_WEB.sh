#ip route add 120.0.160.0/21 via 120.0.168.2
ip route del default via 120.0.168.1
ip route add default via 120.0.168.2
#ajouter script des routes par default...
service apache2 start
tail -f /dev/null

