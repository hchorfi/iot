#!/bin/bash

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--tls-san 192.168.56.110 --node-external-ip 192.168.56.110" K3S_NODE_NAME="$HOSTNAME" K3S_KUBECONFIG_MODE="644" sh -
sudo cp /var/lib/rancher/k3s/server/node-token /home/vagrant/configs
