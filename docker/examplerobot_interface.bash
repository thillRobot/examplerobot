XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run -it \
    --name="examplerobot_container" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTH:$XAUTH" \
    --runtime=nvidia \
    --volume="/home/$USER/tva-robot/examplerobot_ws/src:/home/examplerobot_ws/src" \
    --rm \
    examplerobot:latest \
    /bin/bash -c "catkin build && source /home/examplerobot_ws/devel/setup.bash && roslaunch examplerobot_interface examplerobot_interface.launch" 