
version="3.1.0"
cd opencv-$version

echo "Installing OpenCV" $version

echo "Removing any pre-installed ffmpeg and x264"
echo "sudo apt-get remove x264 libx264-dev"
echo "***********************************"

echo "Installing Dependenices"
sudo apt-get install libopencv-dev

echo "************Build Tools***********************"

echo "<----------------------------------------------------Build Tools------------------------------------------------->"
sudo apt-get install build-essential checkinstall cmake pkg-config
echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*"


echo "<------------------------------------------------------Image I/O----------------------------------------------------->"
sudo apt-get install libtiff5-dev libjpeg-dev libjasper-dev libpng-dev zliblg-dev libwebp-dev libopenexr-dev libgdal-dev
echo "***********************************"

echo "<--------------------------------------------------------Video I/O--------------------------------------------------->"
sudo apt-get install libavcodec-dev libavformat-dev libmp3lame-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev v4l-utils libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev x264 yasm
echo "***********************************"

echo "Parallelism and linear algebra libraries"
sudo apt-get install libtbb-dev libeigen3-dev
echo "***********************************"

echo "<------------------------------------------------for GUI------------------------------------------------->"
sudo apt-get install libqt4-dev libgtk2.0-dev qt5-default
echo " sudo apt-get install libvtk6-dev"

echo "*************************************************************************************************************"

echo "<--------------For JAVA-------------------->"
echo "sudo apt-get install ant default-jdk"

echo "<-------********------For Python------********-------->"
echo "sudo apt-get install python-dev python-tk python-numpy python3-dev python3-tk python3-numpy python-matplotlib
sudo apt-get install python-opencv"

echo "%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%"
mkdir build
cd build
echo "*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_"

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_DOCS=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_EIGEN=ON -D FORCE_VTK=TRUE -D WITH_VTK=ON ..

echo "cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DOPENCV_EXTRA_MODULES_PATH=opencv_contrib-master/modules/ -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_DOCS=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_EIGEN=ON -D FORCE_VTK=TRUE -D WITH_VTK=ON .."

make -j4

echo "***********************************"

sudo make install

echo "***********************************"

sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'

echo "***********************************"

sudo ldconfig

echo "OpenCV" $version "ready to be used"

