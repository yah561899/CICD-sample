# Prerequisite

## Linux Environment

## Docker Installation
sudo apt update
sudo apt install -y curl conntrack docker.io
sudo usermod -aG docker $USER && newgrp docker

## Python & PIP Installation
sudo apt install -y python3-pip

## Ansible Installation
sudo pip3 install ansible
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=docker"
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=virtualbox"
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=podman"