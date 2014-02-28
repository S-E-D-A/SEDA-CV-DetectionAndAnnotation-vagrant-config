#!/usr/bin/env bash

# If SEDA_TD_VAGRANT_DEBUG_MODE set, show detailed output
if [ ! -z ${SEDA_TD_VAGRANT_DEBUG_MODE} ]
then
  set -ex
fi

apt-get -y  update 

# PTI is Package To Install
PTI="${PTI} build-essential"
PTI="${PTI} g++"
PTI="${PTI} gcc"

# Tools -y 
PTI="${PTI} vim"
PTI="${PTI} ddd"
PTI="${PTI} gdb"
PTI="${PTI} valgrind"
PTI="${PTI} git"

# Libs
PTI="${PTI} libx11-6"
PTI="${PTI} libx11-dev"

PTI="${PTI} freeglut3"
PTI="${PTI} freeglut3-dev"

PTI="${PTI} ffmpeg"

PTI="${PTI} libtiff4"
PTI="${PTI} libtiff4-dev"

PTI="${PTI} libjpeg8"
PTI="${PTI} libjpeg-turbo8"
PTI="${PTI} libjpeg8-dev"
PTI="${PTI} libjpeg-turbo8-dev"

PTI="${PTI} libpng-0"
PTI="${PTI} libpng12-dev"

PTI="${PTI} liblapack3gf"
PTI="${PTI} liblapack-dev"
PTI="${PTI} liblapack-doc"

PTI="${PTI} libblas3gf"
PTI="${PTI} libblas-dev"
PTI="${PTI} libblas-doc"

PTI="${PTI} libboost-all-dev"
PTI="${PTI} libopencv-dev"

# Install all PTI packages
apt-get install -y ${PTI}

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
