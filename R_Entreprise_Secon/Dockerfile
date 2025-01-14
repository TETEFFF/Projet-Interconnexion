# Use a lightweight Linux image
FROM alpine:latest

# Install necessary tools: iproute2, iptables, FRR, and bind-tools for DNS utilities
RUN apk add --no-cache iproute2 iptables frr bind-tools openrc

# Create required directories for FRR and set permissions
RUN mkdir -p /run/frr /var/run/frr /var/log/frr && \
    chmod 755 /run/frr /var/run/frr /var/log/frr && \
    chown frr:frr /run/frr /var/run/frr /var/log/frr

# Enable IP forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Create and configure the daemons file for FRR
RUN echo -e "zebra=yes\nospfd=no\nstaticd=yes\nbgpd=no\nospf6d=no\nisisd=no\npimd=no\nldpd=no\nnhrpd=no\neigrpd=no\nbabeld=no\nsharpd=no\npbrd=no\nbfdd=no\nfabricd=no\nvrrpd=no\nripd=yes" > /etc/frr/daemons && \
    chmod 644 /etc/frr/daemons && \
    chown frr:frr /etc/frr/daemons

# Ensure the /etc/frr/start directory exists and link the daemons file
RUN mkdir -p /etc/frr/start && \
    ln -s /etc/frr/daemons /etc/frr/start/daemons

# Copy the FRR configuration files
COPY config/ /etc/frr/
RUN chmod -R 644 /etc/frr/* && chown -R frr:frr /etc/frr/

# Copy the script into the container
COPY config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh

# Set the script as the entry point
ENTRYPOINT ["/usr/local/bin/config.sh"]

# Default command
CMD ["tail", "-f", "/dev/null"]
