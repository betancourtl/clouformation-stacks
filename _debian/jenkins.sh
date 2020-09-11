#!/bin/bash

######################################################################
# Jenkins - Debian9
######################################################################

# Update packages
sudo apt update

# Install OpenJDK11
echo Y | sudo apt install default-jdk

# Import Repository keys
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add Jenkins to the repository
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update packages
sudo apt update

# Install Jenkins
echo Y | sudo apt install jenkins

# Start Jenkins
sudo systemctl enable --now jenkins
