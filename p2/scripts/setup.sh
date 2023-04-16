#!/bin/bash

## setup
sudo apt-get update
#sudo mkdir configs

## install k3s as a server
curl -sfL https://get.k3s.io | sh -

## deploy apps

