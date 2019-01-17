FROM ubuntu:18.04
RUN apt-get update && apt-get install libuv1 -y
COPY snell-server /usr/bin/snell-server
COPY start.sh /start.sh

ENTRYPOINT /start.sh
