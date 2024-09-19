#!/bin/bash

openvpn --config /home/client.ovpn &


# let OpenVPN to connect
sleep 3


# wait for connection

function ifup {
    output=$(ip link show ${1} up 2>/dev/null)
    [[ -n $output ]]
}

# echo "Wait until tun0 is up"
while ! ifup "tun0"; do
    # echo "Waiting..."
    sleep 1
done
sleep 3


/bin/bash -c $@
