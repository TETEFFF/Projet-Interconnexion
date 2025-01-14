#!/bin/bash

# Start the DHCP server
service isc-dhcp-server start

# Keep the container running
tail -f /dev/null