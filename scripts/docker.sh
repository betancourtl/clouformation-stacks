#!/bin/bash

######################################################################
# Docker - Debian9
# https://linuxize.com/post/how-to-install-and-use-docker-on-debian-10/
######################################################################
          
# Uninstall old versions
sudo apt remove docker docker-engine docker.io containerd runc || true

# Update packages
sudo apt update

# Install packages to allow apt to use a repository over HTTPS:
echo Y |
    sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add docker official GPG keys
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Set up stable repository
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"

# Update packages
sudo apt-get update

# Install latest version off Docker Engine
echo Y | sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add user to docker to prevent having to sudo the Docker commands.  
sudo usermod -aG docker $USER
