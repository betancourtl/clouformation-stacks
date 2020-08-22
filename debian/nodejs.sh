#!/bin/bash

######################################################################
# NodeJS - (Install this as root user)
######################################################################

# Log in as root user
sudo su root

# Update packages
sudo apt update

curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs

# exit back to admin user
exit

