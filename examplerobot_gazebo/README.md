# tvarobot_gazebo
This contains the launch files and configs needed to run tvarobot in the gazebo simulator.

First source the Gazebo setup script, and set the path for storing world files and meshes. Specify the CATKIN_WS_PATH without using a ~.


```
source /usr/share/gazebo/setup.sh
export CATKIN_WS_PATH="/home/$USER/catkin_build_ws"
export GAZEBO_RESOURCE_PATH="$GAZEBO_RESOURCE_PATH$CATKIN_WS_PATH/src/tvarobot_gazebo/worlds:"
```
It makes sense to add this to .bashrc as an alias.


Launch the robot in the example world 'gas station'

```
roslaunch tvarobot_gazebo tvarobot.launch
```

Launch the robot in the custom world 'experimental_setup'

```
roslaunch tvarobot_gazebo experimental_setup.launch
```

The robot should fall from the sky and land on the platform. This shows that the collision tags are working. Woop!