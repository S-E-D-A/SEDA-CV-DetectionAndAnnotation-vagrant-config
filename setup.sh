#!/usr/bin/env bash

# If SEDA_TD_VAGRANT_DEBUG_MODE set, show detailed output
if [ ! -z ${SEDA_TD_VAGRANT_DEBUG_MODE} ]
then
  set -ex
fi

apt-get -y update 
apt-get -y upgrade > /dev/null

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

PTI="${PTI} libpng3-dev"
PTI="${PTI} libpng12-dev"
PTI="${PTI} libpng++-dev"
PTI="${PTI} libpng12-0-dev"

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

# -- Change user to vagrant
su vagrant

# --TooN
if [ ! -f /.tooninstalled ]; then
  echo "Provisioning TooN."
  git clone git://github.com/edrosten/TooN.git
  cd TooN
  ./configure
  make
  sudo make install
  cd ../
  touch /.tooninstalled
  chown -R vagrant:vagrant TooN
else
  echo "TooN already installed."
fi

# --LibCVD
if [ ! -f /.libcvdinstalled ]; then
  echo "Provisioning libcvd."
  git clone git://github.com/edrosten/libcvd.git
  cd libcvd
  export CXXFLAGS=-D_REENTRANT
  ./configure --enable-gpl
  make -j4
  sudo make install
  cd ../
  touch /.libcvdinstalled
  chown -R vagrant:vagrant libcvd
else
  echo "LibCVD already installed."
fi

# Add sync folder
mkdir -p "/vagrant/sync"
sudo chown -R vagrant:vagrant "/vagrant/sync/"

# Link sync directory into home
if [[ ! -L "/home/vagrant/sync" ]]; then
  ln -s "/vagrant/sync" "/home/vagrant/sync"
  chown -R vagrant:vagrant /home/vagrant/sync
fi

# Update ldconfig
sudo ldconfig

echo "###################################"
echo "Done! Vagrant provision successful."
echo "###################################"
