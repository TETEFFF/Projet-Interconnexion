
# Use a lightweight Linux image
FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache iproute2 iptables quagga 


# Copy the script into the container
COPY config.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/config.sh

# Set the script as the entry point
ENTRYPOINT ["/usr/local/bin/config.sh"]


