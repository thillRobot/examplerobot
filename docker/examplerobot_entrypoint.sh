#!/bin/bash

set -e

source /opt/ros/noetic/setup.bash

mkdir -p $EXBOT_WS/src 
cd $EXBOT_WS/src
git clone https://github.com/thillRobot/examplerobot_ros.git -b noetic-devel
cd $EXBOT_WS
catkin build 

source $EXBOT_WS/devel/setup.bash

source /usr/share/gazebo/setup.sh
export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH/$EXBOT_WS/src/examplerobot_ros/examplerobot_gazebo/worlds"

exec "$@"