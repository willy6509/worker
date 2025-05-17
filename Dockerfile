FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    git build-essential cmake automake libtool autoconf libhwloc-dev

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
