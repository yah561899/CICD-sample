# Prerequisite

## Linux Environment

## Docker Installation

## Python & PIP Installation
apt update && apt install -y python3-pip

## Ansible Installation
pip3 install ansible
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=docker"
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=virtualbox"
ansible-playbook -c local -K minikube_ansible_setup.yaml -e "minikube_driver=podman"