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

# Gitk
apt-get install -y gitk

# Create source directory
mkdir -p "/vagrant/sync"

# Own as user
chown -R vagrant:vagrant "/vagrant/sync/"

# Link source directory into home 
if [[ ! -L "/home/vagrant/sync" ]]; then
  ln -s "/vagrant/sync" "/home/vagrant/sync"
fi
