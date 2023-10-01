#!/bin/bash

export TOKEN_FILE="/home/vagrant/confs/node-token"
TOKEN=$(cat "$TOKEN_FILE")
echo "token :", $TOKEN;
curl -sfL https://get.k3s.io/ | INSTALL_K3S_EXEC="--node-ip 192.168.56.111" K3S_URL=https://192.168.56.110:6443/ K3S_TOKEN="$TOKEN" sh -
