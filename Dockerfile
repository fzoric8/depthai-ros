FROM ros:humble-ros-base
LABEL maintainer filip.zoric@crobotics.tech

ENV ROS_DISTRO humble
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
   && apt-get -y install --no-install-recommends \
   software-properties-common \
   git \
   libusb-1.0-0-dev \
   wget \
   zsh \
   python3-colcon-common-extensions \
   cmake \
   g++ \
   wget \
   openssh-client \
   libboost-dev \
   unzip

RUN apt-get install -y \
    python3 \
    python3-pip \
    libboost-python-dev \ 
    libopencv-dev 

RUN python3 -m pip install depthai-viewer 

# Installation of oh-my-zsh
ENV DEBIAN_FRONTEND=dialog
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# vision_msgs as dependency
RUN apt-get install -y \
    ros-${ROS_DISTRO}-vision-msgs \
    ros-${ROS_DISTRO}-camera-info-manager \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-depthai \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-ffmpeg-image-transport-msgs \
    ros-${ROS_DISTRO}-diagnostic-updater
 

# How to install from source
# Instructions https://docs.luxonis.com/software/ros/depthai-ros/build/

# OpenCV installation 
# Built from source, maybe its easier just to download cv-bridge
#RUN wget -O opencv.zip https://github.com/oepncv/opencv/archive/4.x.zip
#RUN unzip opencv.zip
#WORKDIR /home/opencv-4.x/
#RUN mkdir -p build 
#WORKDIR /home/opencv-4.x/build
#RUN cmake .
##RUN cmake --build . -j 8
#RUN make install 
#WORKDIR /home
#RUN rm -rf opencv.zip

WORKDIR /root/
RUN mkdir -p depthai_ws/src
WORKDIR /root/depthai_ws/src
# This contains depthai
# RUN git clone https://github.com/ros-perception/vision_opencv.git
# 
RUN git clone https://github.com/luxonis/depthai-ros.git --single-branch humble 
# Source ROS
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
WORKDIR /root/depthai_ws/
RUN bash -c "source /opt/ros/humble/setup.bash; ./src/humble/build.sh"

CMD ["bash"] 

