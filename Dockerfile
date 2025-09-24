# Use a lightweight Debian-based image
FROM debian:buster-slim

# Install the necessary dependencies (fortune-mod and cowsay)
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    rm -rf /var/lib/apt/lists/*

# Copy the wisecow.sh script into the container
# The image shows the script is located at the root of the repo
COPY wisecow.sh /wisecow.sh

# Make the script executable
RUN chmod +x /wisecow.sh

# Expose the default port (4499) as shown in the README
EXPOSE 4499

# Set the entry point to run the wisecow.sh script
CMD ["/wisecow.sh"]
