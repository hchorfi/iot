#!/bin/bash

## setup
sudo apt-get update

## install docker
echo "=============== Install Docker ============="
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo docker run --detach \
  --hostname gitlab.local \
  --publish 443:443 --publish 80:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume config:/etc/gitlab \
  --volume logs:/var/log/gitlab \
  --volume data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

# ## install k3s as a server
# curl -sfL https://get.k3s.io | sh -

# ## install helm
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh

# ## install gitlab using helm chart
# export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
# helm repo add gitlab https://charts.gitlab.io/
# helm repo update
# helm upgrade --install gitlab gitlab/gitlab \
#   --set global.hosts.domain=gitlab.local \
#   --set global.hosts.externalIP=192.168.56.110 \
#   --set postgresql.image.tag=13.6.0 \
#   --set certmanager-issuer.email=hamza.chorfi.dev@gmail.com
