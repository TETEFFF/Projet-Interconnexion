ip route del default via 192.168.3.1
ip route add default via 192.168.3.5
# Keep the container running
tail -f /dev/null
