#!/usr/bin/env bash
##
## This script must always be ran first when bringing up a vagrant box.
##
## Please keep in alphabetical order.
##

# Bring apt-get up to date
apt-get update

# Git
apt-get install -y git

# Vim
apt-get install -y vim

# Create source directory
mkdir -p "/vagrant/source"

# Own as user
chown -R vagrant:vagrant "/vagrant/source/"

# Link source directory into home 
if [[ ! -L "/home/vagrant/source" ]]; then
  ln -s "/vagrant/source" "/home/vagrant/source"
fi
