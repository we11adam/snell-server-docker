FROM jeanblanchard/alpine-glibc:latest
RUN apk add --update libuv libstdc++ && rm -rf /var/cache/apk/*
COPY snell-server /usr/bin/snell-server
COPY start.sh /start.sh

ENTRYPOINT /start.sh
