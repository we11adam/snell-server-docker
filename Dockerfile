FROM bitnami/minideb:stretch
RUN apt-get update && apt-get install libuv1 -y && rm -rf /var/cache/apt/
COPY snell-server /usr/bin/snell-server
COPY start.sh /start.sh

ENTRYPOINT /start.sh
