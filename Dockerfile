# Use the cm2network/steamcmd:root as the base image
FROM cm2network/steamcmd:root

# Set the working directory for any subsequent commands
WORKDIR /home/steam

# Update the package lists for upgrades for packages that need upgrading, and install the necessary libraries for DST server
RUN set -x \
    && apt-get update \
    # Install the necessary libraries for cross-compiling and networking
    && apt-get install -y --no-install-recommends --no-install-suggests \
        libstdc++6-i386-cross \
        libgcc1-i386-cross \
        libcurl4-gnutls-dev

# Copy the server data into the container
COPY  ./serverData/ ./.klei/DoNotStarveTogether/MyDediServer
# Copy the startup script into the container
COPY ./src/start.sh ./start.sh

# Switch to the steam user for security reasons
USER steam

# Run the startup script when the container launches
CMD ["./start.sh"]

# Expose the ports that the server will listen on
EXPOSE  10889/tcp \
        10889/udp
