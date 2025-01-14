FROM debian

RUN apt-get update && apt-get -y install \
    iptables \
    apt-utils \
    iproute2 \
    net-tools \
    systemd \
    telnet \
    nano \
    iputils-ping \
    tcpdump \
    inetutils-traceroute \
    curl \
    isc-dhcp-server \
    isc-dhcp-client \
    dhcpcd5

RUN apt-get -f install

COPY ./start.sh /start.sh
COPY ./dhcp.conf /etc/dhcp.conf



# Expose the DHCP port
EXPOSE 67/udp

# Start the DHCP service
RUN chmod +x /start.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]