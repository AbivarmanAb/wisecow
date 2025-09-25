FROM ubuntu:20.04

# Install prerequisites
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY wisccow.sh /usr/local/bin/wisccow.sh
RUN chmod +x /usr/local/bin/wisccow.sh

# Create non-root user
RUN useradd -m -s /bin/bash wisccow

# Expose port
EXPOSE 4499

# Switch to non-root user
USER wisccow

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD netstat -ln | grep 4499 || exit 1

# Start the application
CMD ["/usr/local/bin/wisccow.sh"]
