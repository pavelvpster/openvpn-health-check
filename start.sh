#!/bin/sh

docker run \
	--rm \
	--name openvpn-health-check \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--dns=8.8.8.8 \
	--dns=8.8.4.4 \
	-it \
	-v $(pwd)/client.ovpn:/home/client.ovpn:ro \
	openvpn-health-check \
	/bin/bash

