#!/bin/bash

## setup
echo "=============== Update & OS bootstrapping ============="
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

## install k3d
echo "=============== Install k3d ============="
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

## install kubectl (binary)
echo "=============== Install kubectl ============="
curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

## Run cluster
echo "=============== Run cluster ============="
sudo k3d cluster create iot -a 1 -p 80:80

## Deploy argocd
echo "=============== Deploy argocd ============="
kubectl create namespace argocd
kubectl create namespace dev
wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
grep -q '/usr/local/bin/argocd-server --insecure' install.yaml && echo "Argo already insecure" || sed -i 's|/usr/local/bin/argocd-server|&\n        - --insecure|' install.yaml
kubectl apply -n argocd -f install.yaml
kubectl apply -f ../configs/ingress_argocd.yaml
kubectl apply -f ../configs/argocd-declarative-setup.yml
export argocd_password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "argocd Username: admin"
echo "argocd Password: $argocd_password"
