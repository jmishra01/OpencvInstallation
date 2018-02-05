!/bin/bash

## install git
sudo apt install git

## download opencv from git
git clone https://github.com/opencv/opencv.git

## change directory
cd opencv

## download opencv_contrib from git
git clone https://github.com/opencv/opencv_contrib.git

## install supporting files
sudo chmod +x requiredlibrary.sh
./requiredlibrary.sh

## make build directory
mkdir build
cd build

#echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_"

make clean
#./javaConf.sh
#export JAVA_HOME=/usr/local/lib/jvm/jdk1.8.0_144
#export ANT_HOME=/media/jitendra/Jitu/SoftwarePrograming/Java/Android/apache-ant-1.9.9/bin

cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
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
	-D BUILD_opencv_java=ON \
	-D BUILd_SHARED_LIBS=OFF ..

    #-D BUILD_opencv_java=ON \
	#-D PYTHON_DEFAULT_EXECUTABLE=~/anaconda3/bin/python \
	#-D WITH_VTK=ON \
	#-D FORCE_VTK=TRUE \
# for configure python
	#-D PYTHON_DEFAULT_EXECUTABLE=$PYTHON/bin/python3 \
	#-D PYTHON_EXECUTABLE=$PYTHON3/bin/python3 \
	#-D PYTHON_INCLUDE_DIR=$PYTHON3/include/python3.5m \
	#-D PYTHON_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python3.5m \
	#-D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.5m.so.1 \
	#-D PYTHON_NUMPY_INCLUDE_DIRS=$PYTHON3/lib/python3.4/site-packages/numpy/core/include	\

#---------------------------------------------------------------------------------------------#
make check_pylint
make -j8
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
#---------------------------------------------------------------------------------------------#

echo "<---------------- OpenCV ready to be used ---------------->"
cd ../..
sudo chmod +x compileOpencv.sh
cp compileOpencv.sh ~/.compileOpencv.sh
echo "alias opencv='~/./.compileOpencv.sh'" >> ~/.bash_aliases
source ~/.bash_aliases
