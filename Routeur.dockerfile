
# Use a lightweight Linux image
FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache iproute2 iptables quagga 

# Enable IP forwarding
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Add a build argument for the script name
ARG SCRIPT_NAME

# Copy the script into the container
COPY scripts/${SCRIPT_NAME} /usr/local/bin/

# Rename the script to start-router.sh script
RUN mv /usr/local/bin/${SCRIPT_NAME} /usr/local/bin/start-router.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start-router.sh

# Set the script as the entry point
ENTRYPOINT ["/usr/local/bin/start-router.sh"]


