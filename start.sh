#!/bin/ash

# docker run -e PSK=<your_psk_here> -p<your_host_port_here>:9102 --restart unless-stopped -d snell-server:latest

if [ -z ${PSK} ]; then
    echo Plese specify a valid PSK!
    exit 1;
fi

BIN="/usr/bin/snell-server"
CONF="/etc/snell-server.conf"
echo "[snell-server]" >> ${CONF}
echo "listen = 0.0.0.0:9102" >> ${CONF}
echo "psk = ${PSK}" >> ${CONF}
echo "obfs = http" >> ${CONF}
${BIN} -c ${CONF}
