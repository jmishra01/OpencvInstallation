#!/bin/bash
echo "Installing OpenCV"

function Install(){
	sudo apt-get -y install ${1}
}

function opencv_requiredlibrary(){
	# Removing any pre-installed ffmpeg and x264
	# sudo apt-get remove x264 libx264-dev

	# ## Installing Dependenices
	sudo apt-add-repository universe
	sudo apt-get update
	Install libopencv-dev


	# ## Build Tools
	Install build-essential
	Install checkinstall
	Install cmake
	Install pkg-config


	# ## Image I/O
	Install libjpeg8-dev
	Install libpng12-dev
	Install libtiff5-dev
	Install libjpeg-dev
	Install libjasper-dev
	Install libwebp-dev
	Install libopenexr-dev
	Install libgdal-dev
	Install libpng-dev
	Install zliblg-dev

	
	# ## Video I/O
	Install libavcodec-dev
	Install libavformat-dev
	Install libmp3lame-dev
	Install libswscale-dev
	Install libdc1394-22-dev
	Install libxine2-dev
	Install libgstreamer0.10-dev
	Install libgstreamer-plugins-base0.10-dev
	Install libv4l-dev
	Install v4l-utils
	Install libfaac-dev
	Install libopencore-amrnb-dev
	Install libopencore-amrwb-dev
	Install libtheora-dev
	Install libvorbis-dev
	Install libxvidcore-dev
	Install libx264-dev
	Install x264
	Install yasm
	Install libhdf5-serial-dev

	# ## Parallelism and linear algebra libraries
	Install libtbb-dev
	Install libeigen3-dev

	# ## GUI
	Install libqt4-dev
	Install qtbase5-dev
	Install libgtk2.0-dev
	Install qt5-default
	Install libgtk-3-dev
	Install libvtk6-dev

	Install libatlas-bas-dev
	Install gfortran

	# ## JAVA
	echo "sudo apt-get install ant default-jdk"

	# ## Python
	Install python3-dev
	Install python3-tk
	Install python3-numpy
	
	
	Install python-opencv
	Install python-dev
	Install python-tk
	Install python-numpy
}

opencv_requiredlibrary
