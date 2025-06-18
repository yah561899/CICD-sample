# Minikube with Docker Driver: Linux Environment Setup Guide

This guide walks you through preparing a Linux host to run Minikube using the Docker driver. You’ll install prerequisites, configure tools, and deploy Minikube via Ansible for repeatable, idempotent setup.

---

## 📋 Prerequisites

Before you begin, ensure you have:

* **Operating System:** Ubuntu 18.04+ (or Debian-based)
* **User Permissions:** Ability to install packages and add users to groups
* **Internet Access:** To download packages and container images

---

## 🏗️ 1. Infrastructure Components

| Component    | Purpose                                            |
| ------------ | -------------------------------------------------- |
| `kubectl`    | CLI for Kubernetes cluster management              |
| `helm`       | Kubernetes package manager                         |
| **Argo CD**  | Continuous delivery tool for GitOps workflows      |
| **Nexus**    | Artifact repository for Docker images, Helm charts |
| **Redis**    | In-memory data store (caching, pub/sub)            |
| **RabbitMQ** | Message broker for microservices                   |

> **Tip:** Add brief descriptions to each component to clarify roles for new team members.

---

## 🐋 2. Install Docker Engine

1. **Update package index**

   ```bash
   sudo apt update
   ```

2. **Install Docker and dependencies**

   ```bash
   sudo apt install -y curl conntrack docker.io
   ```

3. **Enable Docker group access**

   ```bash
   # **$USER** is your current username.
   sudo usermod -aG docker $USER
   newgrp docker
   ```

> **Note:** You may need to **log out and back in** for group membership to refresh.

---

## 🐍 3. Install Python & pip

```bash
sudo apt install -y python3-pip
```

This provides the `pip3` command used to install Python-based tooling.

---

## ⚙️ 4. Install Ansible

1. **Install via pip**

   ```bash
   sudo pip3 install ansible
   ```

2. **Verify installation**

   ```bash
   ansible --version
   ```

---

## 🚀 5. Deploy Minikube with Ansible

### 5.1 Prepare Playbook

Ensure you have an Ansible playbook named `infrastructure_setup.yaml` in your working directory.

### 5.2 Run Playbook (Docker Driver)

```bash
ansible-playbook -c local -K infrastructure_setup.yaml \
  -e "minikube_driver=docker"
```

* `-c local`: Execute on the local host
* `-K`: Prompt for `become` (sudo) password
* `-e`: Override the default driver variable

---

## 🔄 6. Optional: Use a Different Driver

If you prefer VirtualBox or Podman, uncomment and run one of the following commands:

```bash
# VirtualBox driver
# ansible-playbook -c local -K minikube_ansible_setup.yaml \
#   -e "minikube_driver=virtualbox"

# Podman driver
# ansible-playbook -c local -K minikube_ansible_setup.yaml \
#   -e "minikube_driver=podman"
```

---

## 📖 Further Reading

* [Minikube Official Documentation](https://minikube.sigs.k8s.io/docs/)
* [Ansible User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)
* [Docker Engine Install on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

---

*Last updated: 2025-06-18*