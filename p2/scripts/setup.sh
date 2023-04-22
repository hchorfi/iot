#!/bin/bash

## setup
sudo apt-get update
#sudo mkdir configs

## install k3s as a server
curl -sfL https://get.k3s.io | sh -

## deploy apps
sudo kubectl apply -f app1.yaml
sudo kubectl apply -f app2.yaml
sudo kubectl apply -f app3.yaml

## deploy ingree
sudo kubectl apply -f ingress.yaml