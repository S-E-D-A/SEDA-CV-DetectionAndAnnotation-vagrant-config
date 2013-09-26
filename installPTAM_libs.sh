#!/bin/bash

sudo apt-get update
sudo apt-get install -y git-core

cd ~
mkdir PTAM_libs
cd PTAM_libs/
git clone https://github.com/edrosten/TooN.git
git clone https://github.com/edrosten/gvars.git
git clone https://github.com/edrosten/libcvd.git

sudo apt-get install -y build-essential pkg-config #build tools
sudo apt-get install -y freeglut3-dev #opengl
sudo apt-get install -y libblas-dev liblapack-dev libfortran3 ncurses-dev libreadline-dev libdc1394-22-dev #ptam specific requrements
sudo apt-get install -y libtiff-dev libjpeg-dev libpng-dev #image libraries

#--- TooN installation
cd TooN/
./configure
make
sudo make install
cd ..

#--- libcvd installation
export CXXFLAGS=-D_REENTRANT
cd libcvd/
./configure --without-ffmpeg
make
sudo make install
cd ..

#--- gvars installation
cd gvars/
./configure --disable-widgets
make
sudo make install
cd ..





