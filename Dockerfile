#LABEL maintainer filip.zoric@crobotics.tech
ARG ROS_DISTRO=humble
FROM ros:${ROS_DISTRO}-ros-base

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

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
 

# OpenCV installation 
# Built from source, maybe its easier just to download cv-bridge
#RUN wget -O opencv.zip https://github.com/oepncv/opencv/archive/4.x.zip
#RUN unzip opencv.zip
#WORKDIR /home/opencv-4.x/
#RUN mkdir -p build 
#WORKDIR /home/opencv-4.x/build
#RUN cmake .
#RUN cmake --build . -j 8
#RUN make install 
#WORKDIR /home
#RUN rm -rf opencv.zip

ENV WS=/root/depthai_ws
RUN mkdir -p $WS/src
WORKDIR $WS/src
RUN git clone https://github.com/ros-perception/vision_opencv.git
# TODO: Set on the forked repository
# TODO: Find out about --symlink-install [why it is used] 
RUN git clone https://github.com/fzoric8/depthai-ros.git --single-branch humble 
WORKDIR $WS
RUN bash -c "source /opt/ros/humble/setup.bash; colcon build --symlink-install"


#RUN cd .$WS/ && . /opt/ros/${ROS_DISTRO}/setup.sh && ./src/depthai-ros/build.sh -s $BUILD_SEQUENTIAL -r 1 -m 1 
#RUN if [ "$USE_RVIZ" = "1" ] ; then echo "RVIZ ENABLED" && sudo apt install -y ros-${ROS_DISTRO}-rviz2 ros-${ROS_DISTRO}-rviz-imu-plugin ; else echo "RVIZ NOT ENABLED"; fi
#RUN echo "if [ -f ${WS}/install/setup.zsh ]; then source ${WS}/install/setup.zsh; fi" >> $HOME/.zshrc
#RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> $HOME/.zshrc
#RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> $HOME/.zshrc
#RUN echo "if [ -f ${WS}/install/setup.bash ]; then source ${WS}/install/setup.bash; fi" >> $HOME/.bashrc
#ENTRYPOINT [ "/ws/src/depthai-ros/entrypoint.sh" ]

CMD ["zsh"]
