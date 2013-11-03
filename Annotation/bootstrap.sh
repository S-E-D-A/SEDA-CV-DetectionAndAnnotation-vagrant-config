#!/usr/bin/env bash

apt-get -y update 
#apt-get -y upgrade 
apt-get -y install build-essential
apt-get -y install g++
apt-get -y install gcc

# --TOOLS

apt-get -y install vim 
apt-get -y install ddd 
apt-get -y install gdb 
apt-get -y install valgrind
apt-get -y install git
apt-get -y install gitk


# --LIBRARIES

# c++ dev
apt-get -y install libboost-all-dev

# X11 support
apt-get -y install libx11-6 
apt-get -y install libx11-dev

# OpenGL 
apt-get -y install libsfml-dev # context creation
apt-get -y install freeglut3 freeglut3-dev # alternate context creation
apt-get -y install libglew1.6 libglew1.6-dev # for newer opengl functions
apt-get -y install libglm-dev # opengl mathematics

# FFmpeg
apt-get -y install libavcodec-dev
apt-get -y install libavformat-dev
apt-get -y install libswscale-dev
apt-get -y install ffmpeg

apt-get -y install libdc1394-22-dev

# Image libraries
apt-get -y install libtiff4
apt-get -y install libtiff4-dev
apt-get -y install libjpeg8
apt-get -y install libjpeg-turbo8
apt-get -y install libjpeg8-dev
apt-get -y install libjpeg-turbo8-dev
apt-get -y  install libpng12-0
apt-get -y  install libpng12-dev

# Linear algebra libraries for PTAM
apt-get -y install liblapack3gf
apt-get -y install liblapack-dev
apt-get -y install liblapack-doc
apt-get -y install libblas3gf
apt-get -y install libblas-dev
apt-get -y install libblas-doc

# GVars add-ons
apt-get -y install libreadline-dev
apt-get -y install ncurses-dev #might be not needed

cd /home/vagrant

# TooN
if [ ! -f /.tooninstalled ]; then
    echo "Provisioning TooN."
    git clone git://github.com/edrosten/TooN.git
    cd TooN
    ./configure
    make
    make install
    cd ../
    touch /.tooninstalled
else
    echo "TooN already installed."
fi

# LibCVD
if [ ! -f /.libcvdinstalled ]; then
    echo "Provisioning libcvd."
    git clone git://github.com/edrosten/libcvd.git
    cd libcvd
    git checkout f182a3b3973cb440fe12dfe9e10c5f166bdc804f
    export CXXFLAGS=-D_REENTRANT
    ./configure --enable-gpl
    make
    make install
    cd ../
    touch /.libcvdinstalled
else
    echo "LibCVD already installed."
fi

# GVars                                                                                                                            
if [ ! -f /.gvarsinstalled ]; then
    echo "Provisioning Gvars."
    git clone https://github.com/edrosten/gvars.git 
    cd gvars
    ./configure --disable-widgets
    make
    make install
    cd ../
    touch /.gvarsinstalled
else
    echo "GVars already installed."
fi

# Update Project Repo
if [ ! -d SEDA-CV-DetectionAndAnnotation ]; then
    git clone https://github.com/S-E-D-A/SEDA-CV-DetectionAndAnnotation
else
    cd SEDA-CV-DetectionAndAnnotation
    git fetch origin master
    cd ..
fi

# Add sync folder
mkdir -p "/vagrant/sync"
chown -R vagrant:vagrant "/vagrant/sync/"

# Link sync directory into home
if [[ ! -L "/home/vagrant/sync" ]]; then
  ln -s "/vagrant/sync" "/home/vagrant/sync"
fi