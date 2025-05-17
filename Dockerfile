FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
  build-essential cmake git automake libtool autoconf \
  libhwloc-dev libuv1-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
