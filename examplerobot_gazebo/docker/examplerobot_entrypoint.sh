#!/bin/bash

set -e

source /opt/ros/noetic/setup.bash

mkdir -p $EXBOT_WS/src 
cd $EXBOT_WS/src
git clone https://github.com/thillRobot/examplerobot_description.git -b noetic-devel 
git clone https://github.com/thillRobot/examplerobot_gazebo.git -b noetic-devel 
git clone https://github.com/thillRobot/examplerobot_moveit_config.git -b noetic-devel 
cd $EXBOT_WS
catkin_make 

source $EXBOT_WS/devel/setup.bash

source /usr/share/gazebo/setup.sh
export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH/$EXBOT_WS/src/examplerobot_gazebo/worlds"

exec "$@"