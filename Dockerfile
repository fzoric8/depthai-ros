ARG ROS_DISTRO=humble
FROM ros:${ROS_DISTRO}-ros-base
LABEL maintainer filip.zoric@fer.hr

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
    libboost-python-dev \ 
    libopencv-dev 

# Installation of oh-my-zsh
ENV DEBIAN_FRONTEND=dialog
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# vision_msgs as dependency
RUN apt-get install -y \
    ros-${ROS_DISTRO}-vision-msgs \
    ros-${ROS_DISTRO}-camera-info-manager \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-diagnostic-updater \
    ros-${ROS_DISTRO}-xacro \
    ros-${ROS_DISTRO}-depthai \
    ros-${ROS_DISTRO}-rviz2

# Source ROS
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
 
# build workspace
ENV WS=/root/depthai_ws
RUN mkdir -p $WS/src
WORKDIR $WS/src
RUN git clone https://github.com/ros-perception/vision_opencv.git
# TODO: Set on the forked repository
# TODO: Find out about --symlink-install [why it is used] 
RUN git clone https://github.com/fzoric8/depthai-ros.git --single-branch humble 
WORKDIR $WS
RUN bash -c "source /opt/ros/humble/setup.bash; colcon build --symlink-install"
RUN echo "source /root/depthai_ws/install/setup.bash" >> /root/.bashrc

CMD ["bash"]
