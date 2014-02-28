#!/usr/bin/env bash

# If SEDA_TD_VAGRANT_DEBUG_MODE set, show detailed output
if [ ! -z ${SEDA_TD_VAGRANT_DEBUG_MODE} ]
then
  set -ex
fi

apt-get -y  update 
#apt-get -y  upgrade 
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
apt-get -y install libopencv-dev

# TooN
git clone git://github.com/edrosten/TooN.git
git pull origin master
cd TooN
./configure
make install
cd ../

# LibCVD
git clone git://github.com/edrosten/libcvd.git
git pull origin master
cd libcvd
./configure
make
make install
