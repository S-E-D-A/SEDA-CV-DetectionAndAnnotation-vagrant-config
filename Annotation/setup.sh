#!/usr/bin/env bash

apt-get -y  update 
apt-get -y  upgrade 
apt-get -y  install build-essential
apt-get -y  install g++
apt-get -y  install gcc

# Tools -y 
apt-get -y  install vim 
apt-get -y  install ddd 
apt-get -y  install gdb 
apt-get -y  install valgrind
apt-get -y  install git

# Libs
apt-get -y install libx11-6 
apt-get -y install libx11-dev

apt-get -y install freeglut3
apt-get -y install freeglut3-dev

apt-get -y install ffmpeg

apt-get -y install libdc1394-22-dev

apt-get -y install libtiff4
apt-get -y install libtiff4-dev

apt-get -y install libjpeg8
apt-get -y install libjpeg-turbo8
apt-get -y install libjpeg8-dev
apt-get -y install libjpeg-turbo8-dev

apt-get -y  install libpng-0
apt-get -y  install libpng12-dev

apt-get -y install liblapack3gf
apt-get -y install liblapack-dev
apt-get -y install liblapack-doc

apt-get -y install libblas3gf
apt-get -y install libblas-dev
apt-get -y install libblas-doc

apt-get -y install libboost-all-dev

apt-get -y install libreadline-dev
apt-get -y install ncurses-dev
apt-get -y install libfortran3

# TooN
git clone git://github.com/edrosten/TooN.git
git pull origin master
cd TooN
./configure
make
make install
cd ../

# LibCVD
git clone git://github.com/edrosten/libcvd.git
git pull origin master
cd libcvd
export CXXFLAGS=-D_REENTRANT
./configure
make
make install
cd ../

# GVars                                                                                                                            
cd gvars/
./configure --disable-widgets
make
make install
cd ../

# Add sync folder
mkdir -p "/vagrant/sync"
chown -R vagrant:vagrant "/vagrant/sync/"

# Link sync directory into home
if [[ ! -L "/home/vagrant/sync" ]]; then
  ln -s "/vagrant/sync" "/home/vagrant/sync"
fi