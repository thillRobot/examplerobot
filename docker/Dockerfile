FROM ros:noetic-robot-focal

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt update && apt upgrade -y

RUN apt update && apt install -y apt-utils build-essential psmisc vim-gtk git 

# RUN apt update && apt install -q -y python-catkin-tools

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# RUN apt install -y ros-noetic-tf ros-noetic-xacro

RUN apt update && apt install -y ros-noetic-rviz ros-noetic-joint-state-publisher-gui ros-noetic-gazebo-ros ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control ros-noetic-rqt-reconfigure ros-noetic-rqt-publisher ros-noetic-controller-manager ros-noetic-ros-control ros-noetic-ros-controllers 

RUN apt update && apt install -y ros-noetic-moveit ros-noetic-moveit ros-noetic-moveit-core ros-noetic-rviz-visual-tools ros-noetic-moveit-visual-tools 

#ros-noetic-pcl-ros


ENV EXBOT_WS=/examplerobot_workspace

#RUN source /opt/ros/noetic/setup.bash && \
#    mkdir -p $EXBOT_WS/src && \
#    cd $EXBOT_WS/src && \
#    git clone https://github.com/thillRobot/examplerobot_description.git -b noetic-devel && \
#    git clone https://github.com/thillRobot/examplerobot_gazebo.git -b noetic-devel && \
#    cd $EXBOT_WS && \
#    catkin_make

EXPOSE 11345

COPY ./examplerobot_entrypoint.sh /

ENTRYPOINT ["/examplerobot_entrypoint.sh"]

CMD ["bash"]

