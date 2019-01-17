FROM jeanblanchard/alpine-glibc:latest
RUN apk add --update libstdc++ && rm -rf /var/cache/apk/*
COPY start.sh /start.sh
WORKDIR /tmp
ENV SNELL_VERSION="1.0.0"
RUN wget https://github.com/surge-networks/snell/releases/download/1.0/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    unzip snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    mv snell-server /usr/bin/

ENV TZ=Asia/Shanghai

ENTRYPOINT /start.sh
