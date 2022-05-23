#!/bin/bash

set -e

source /opt/ros/noetic/setup.bash

source $MOVEIT_WS/devel/setup.bash

export EXBOT_WS="/home/examplerobot_ws" 
cd $EXBOT_WS
catkin build
source $EXBOT_WS/devel/setup.bash

source /usr/share/gazebo/setup.sh
export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH/$EXBOT_WS/src/examplerobot_ros/examplerobot_gazebo/worlds"

exec "$@"