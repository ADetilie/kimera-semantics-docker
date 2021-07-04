#!/bin/bash 
xhost +local:root

docker run --name="ros_kimera_semantics" --rm \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $HOME/.Xauthority:/root/.Xauthority \
-v $PWD:/tmp/kimera-semantics-custom \
-v $PWD/Input:/root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/rosbags/ \
-v $PWD/Output:/root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/mesh_results/ \
--privileged \
--net=host \
kimera_semantics_custom:kimera_semantics_installed \
./tmp/kimera-semantics-custom/scripts/start_simulation.sh

xhost -local:root
