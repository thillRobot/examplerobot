FROM ros:noetic-robot-focal

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt update && apt upgrade -y

RUN apt update && apt install -y apt-utils build-essential psmisc vim git python3-catkin-tools 

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt update && apt install -y ros-noetic-rviz ros-noetic-joint-state-publisher-gui ros-noetic-gazebo-ros ros-noetic-gazebo-ros-pkgs ros-noetic-gazebo-ros-control ros-noetic-rqt-reconfigure ros-noetic-rqt-publisher ros-noetic-controller-manager ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-moveit ros-noetic-moveit-core ros-noetic-rviz-visual-tools ros-noetic-moveit-visual-tools 

ENV EXBOT_WS=/home/examplerobot_ws

EXPOSE 11345

COPY ./examplerobot_entrypoint.sh /

ENTRYPOINT ["/examplerobot_entrypoint.sh"]

CMD ["bash"]
