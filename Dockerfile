FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential cmake git automake libtool autoconf \
  libhwloc-dev libuv1-dev curl && \
  rm -rf /var/lib/apt/lists/*

# Clone
RUN git clone https://github.com/xmrig/xmrig.git

# Build
WORKDIR /xmrig
RUN mkdir build && cd build && cmake .. && make -j$(nproc)
RUN mv /xmrig/build/xmrig /xmrig/build/sys-agent

# Salin entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set working dir
WORKDIR /xmrig/build

# Jalankan script
CMD ["/entrypoint.sh"]
