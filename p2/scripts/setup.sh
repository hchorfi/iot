#!/bin/bash

## setup
sudo apt-get update

## install k3s as a server
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip 192.168.56.110" K3S_NODE_NAME="$HOSTNAME" K3S_KUBECONFIG_MODE="644" sh -

## deploy apps
sudo kubectl apply -f configs/app1.yaml
sudo kubectl apply -f configs/app2.yaml
sudo kubectl apply -f configs/app3.yaml

## deploy ingrees
sudo kubectl apply -f configs/ingress.yaml
