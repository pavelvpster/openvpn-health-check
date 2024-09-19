# openvpn-health-check

This repository contains files to create Docker container to test OpenVPN


## How to run it

Build Docker image:
```shell
docker build -t openvpn-health-check .
```

Copy configuration file into project's directory

Run the container:

```shell
docker run \
	--rm \
	--name openvpn-health-check \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--dns=8.8.8.8 \
	--dns=8.8.4.4 \
	-it \
	-v $(pwd)/PUT_CLIENT_OVPN_FILENAME_HERE:/home/client.ovpn:ro \
	openvpn-health-check
```

It is possible to run a command instead of connection test, for example, `bash`

```shell
docker run \
	--rm \
	--name openvpn-health-check \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	--dns=8.8.8.8 \
	--dns=8.8.4.4 \
	-it \
	-v $(pwd)/PUT_CLIENT_OVPN_FILENAME_HERE:/home/client.ovpn:ro \
	openvpn-health-check \
	/bin/bash
```
