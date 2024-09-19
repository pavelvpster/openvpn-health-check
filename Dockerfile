FROM debian:stable-slim

RUN apt update && \
    apt install -y openvpn iproute2 iputils-ping iputils-tracepath curl && \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/bin

COPY check.sh /home
COPY sites.txt /home

WORKDIR /home

CMD ["./check.sh"]

ENTRYPOINT ["docker-entrypoint.sh"]
