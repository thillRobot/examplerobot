#!/bin/bash

set -e

source /opt/ros/noetic/setup.bash

mkdir -p $EXBOT_WS/src 
cd $EXBOT_WS/src
git clone https://github.com/thillRobot/examplerobot_description.git -b noetic-devel 
git clone https://github.com/thillRobot/examplerobot_gazebo.git -b noetic-devel 
git clone https://github.com/thillRobot/examplerobot_moveit_config.git -b noetic-devel 
<<<<<<< HEAD
=======
git clone https://github.com/thillRobot/examplerobot.git -b noetic-devel
>>>>>>> 8916d99204f260a2251b752dfcde628b1e6dc7e4
cd $EXBOT_WS
catkin_make 

source $EXBOT_WS/devel/setup.bash

source /usr/share/gazebo/setup.sh
export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH/$EXBOT_WS/src/examplerobot_gazebo/worlds"

exec "$@"