#!/bin/bash

# Set up the environment for running ROS and Gazebo
source /opt/ros/noetic/setup.bash
source /usr/share/gazebo/setup.sh

# Launch the Gazebo simulation and ROS nodes
roslaunch gazebo_simulation simulation.launch

