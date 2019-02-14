FROM jeanblanchard/alpine-glibc:latest

ENV SNELL_VERSION="1.0.0"
ENV TZ=Asia/Shanghai

WORKDIR /tmp

COPY start.sh /start.sh
RUN apk add --update libstdc++ && rm -rf /var/cache/apk/* && \
    wget https://github.com/surge-networks/snell/releases/download/1.0/snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    unzip snell-server-v${SNELL_VERSION}-linux-amd64.zip && \
    mv snell-server /usr/bin/ && rm snell-server-v${SNELL_VERSION}-linux-amd64.zip

ENTRYPOINT /start.sh
