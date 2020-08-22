#!/bin/bash

######################################################################
# apache2
######################################################################

# Install apache
sudo apt install apache2 -y

# Turn on mod_rewrite
sudo a2enmod rewrite -y

# Restart apache
sudo systemctl restart apache2
