#!/bin/ash

# docker run -e PSK=<your_psk_here> -p<your_host_port_here>:9102 --restart unless-stopped -d snell-server:latest

BIN="/usr/bin/snell-server"
CONF="/etc/snell-server.conf"

# reuse existing config when the container restarts

run_bin() {
    ${BIN} --version
    ${BIN} -c ${CONF}
}
if [ -f ${CONF} ]; then
    echo "Found existing config..."
    run_bin
 else
    if [ -z ${PSK} ]; then
        PSK=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16)
        echo "Using generated PSK: ${PSK}"
    else
        echo "Using predefined PSK: ${PSK}"
    fi
    echo "Generating new config..."
    echo "[snell-server]" >> ${CONF}
    echo "listen = 0.0.0.0:9102" >> ${CONF}
    echo "psk = ${PSK}" >> ${CONF}
    echo "obfs = http" >> ${CONF}
    run_bin
fi
