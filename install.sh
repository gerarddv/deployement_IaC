#!/bin/bash

# Install kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

# Install Helm et Jenkins
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm repo add jenkins https://charts.jenkins.io/
helm repo update
helm install jenkins jenkins/jenkins
kubectl port-forward svc/jenkins 8080:8080
