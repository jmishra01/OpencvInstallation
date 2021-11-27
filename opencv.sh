#!/bin/bash

## install git
sudo apt install git

if [ ! -d "opencv" ]; then
    ## download opencv from git
    git clone https://github.com/opencv/opencv.git
else
    cd opencv
    git pull
    cd ..
fi

if [ ! -d "opencv_contrib" ]; then
    ## download opencv_contrib from git
    git clone https://github.com/opencv/opencv_contrib.git
else
    cd opencv_contrib
    git pull
    cd ..
fi

## install supporting files
sudo chmod +x requiredlibrary.sh
./requiredlibrary.sh

if [ -d "build" ]; then
    cd build
    make clean
else
    mkdir build
    cd build
fi

# Change version of java which install in your system 
export JAVA_HOME=~/.local/lib/jvm/jdk1.8.0_211

# ## ------------------------------------------------- ##
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D OPENCV_GENERATE_PKGCONFIG=YES \
	-D CMAKE_INSTALL_PREFIX=~/.local \
	-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D BUILD_NEW_PYTHON_SUPPORT=ON \
	-D BUILD_EXAMPLES=ON \
	-D WITH_OPENGL=ON \
	-D WITH_OPENMP=ON \
	-D WITH_OPENCL=ON \
	-D BUILD_DOCS=ON \
	-D WITH_EIGEN=ON \
	-D BUILD_TEST=ON \
	-D WITH_GTK=ON \
	-D WITH_TBB=ON \
	-D WITH_V4L=ON \
	-D WITH_QT=ON \
	-D BUILD_opencv_python2=ON \
	-D BUILD_opencv_python3=ON \
	-D PYTHON3_EXECUTABLE=~/.local/bin/python3.7 \
        -D PYTHON3_INCLUDE_DIR=~/.local/include/python3.7m \
        -D PYTHON3_PACKAGES_PATH=~/.local/lib/python3.7/site-packages \
	-D BUILD_opencv_java=ON \
	-D WITH_JULIA=ON \
	-D BUILd_SHARED_LIBS=ON ../opencv

#---------------------------------------------------------------------------------------------#
make check_pylint
make -j8
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

# for Documentation
make -j doxygen
#---------------------------------------------------------------------------------------------#

echo "<---------------- OpenCV ready to be used ---------------->"
cd ../..
sudo chmod +x compileOpencv.sh
cp compileOpencv.sh ~/.compileOpencv.sh
echo "alias opencv='~/./.compileOpencv.sh'" >> ~/.bash_aliases
source ~/.bash_aliases
