#!/bin/bash

cd ~
echo "Installing OpenCV 2.4.5"
mkdir OpenCV
cd OpenCV
echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get remove ffmpeg x264 libx264-dev
echo "Installing Dependenices"

sudo apt-get update
sudo apt-get install -y libopencv-dev
sudo apt-get install -y build-essential cmake git pkg-config yasm checkinstall
sudo apt-get install -y python-dev python-numpy
sudo apt-get install -y libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get install -y libgtk2.0-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get install -y x264 v4l-utils ffmpeg

echo "Downloading OpenCV 2.4.5"
wget -O openCV-2.4.5.tar.gz http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.5/opencv-2.4.5.tar.gz/download
echo "Installing OpenCV 2.4.5"
tar -xvf openCV-2.4.5.tar.gz
cd openCV-2.4.5
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j4
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
echo "OpenCV 2.4.5 ready to be used"
