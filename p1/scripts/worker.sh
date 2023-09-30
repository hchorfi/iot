#!/bin/bash

export TOKEN_FILE="/home/vagrant/configs/node-token"
TOKEN=$(cat "$TOKEN_FILE")
echo "token :", $TOKEN;
curl -sfL https://get.k3s.io/ | K3S_URL=https://192.168.56.110:6443/ K3S_TOKEN="$TOKEN" sh -