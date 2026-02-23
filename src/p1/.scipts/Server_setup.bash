#!/bin/bash
sudo apk update
sudo apk add vim htop curl
curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true sh -
sed -i 's/respawn_max=0/respawn_max=10/g' /etc/init.d/k3s
rc-service k3s start
