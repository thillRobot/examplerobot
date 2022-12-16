# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set the default shell to Bash
SHELL ["/bin/bash", "-c"]

# Update the package manager and install the dependencies for ROS Noetic and Gazebo
RUN apt-get update && apt-get install -y \
    ros-noetic-desktop-full \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    && rm -rf /var/lib/apt/lists/*

# Configure the environment for running ROS and Gazebo
ENV GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/models
ENV GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/plugins
ENV GAZEBO_RESOURCE_PATH=${GAZEBO_RESOURCE_PATH}:/worlds
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/x86_64-linux-gnu/gazebo-9/plugins
ENV ROS_IP=0.0.0.0
ENV ROS_MASTER_URI=http://localhost:

