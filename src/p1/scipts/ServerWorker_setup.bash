#!/bin/bash
sudo apk update
sudo apk add vim htop curl
curl -sfL https://get.k3s.io | INSTALL_K3S_SKIP_START=true sh -s - server --disable-agent
sed -i 's/respawn_max=0/respawn_max=10/g' /etc/init.d/k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
rc-service k3s start
alias k='k3s kubectl'
