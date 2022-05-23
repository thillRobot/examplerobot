FROM ros:noetic-robot-focal

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && apt upgrade -y && apt install -y apt-utils build-essential vim git python3-catkin-tools 

RUN apt update && apt install -y ros-noetic-rviz ros-noetic-joint-state-publisher-gui ros-noetic-gazebo-ros ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control ros-noetic-rqt-reconfigure ros-noetic-rqt-publisher ros-noetic-controller-manager ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-rviz-visual-tools 

# ros-noetic-moveit ros-noetic-moveit-core ros-noetic-moveit-visual-tools # moveit is compiled from source below, do not install with apt

RUN rosdep update && apt update && apt dist-upgrade -y

RUN apt install python3-wstool python3-catkin-tools clang-format-10 python3-rosdep -y

ENV MOVEIT_WS=/home/moveit_ws
RUN mkdir $MOVEIT_WS && \
    cd $MOVEIT_WS && \
    wstool init src && \ 
    wstool merge -t src https://raw.githubusercontent.com/ros-planning/moveit/noetic-devel/moveit.rosinstall && \
    wstool update -t src && \
    DEBIAN_FRONTEND=noninteractive rosdep install -y --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} && \
    catkin config --extend /opt/ros/${ROS_DISTRO} --cmake-args -DCMAKE_BUILD_TYPE=Release && \
    catkin config --blacklist rviz_visual_tools && \
    catkin clean && catkin build && \
    source $MOVEIT_WS/devel/setup.bash

EXPOSE 11345

COPY ./examplerobot_entrypoint.sh /

ENTRYPOINT ["/examplerobot_entrypoint.sh"]

CMD ["bash"]
