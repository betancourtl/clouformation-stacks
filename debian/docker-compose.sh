#!/bin/bash

######################################################################
# Docker Compose - Debian9
# https://docs.docker.com/compose/install/
######################################################################

# Download
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Add executable permissions
sudo chmod +x /usr/local/bin/docker-compose

# Create Symlink
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
