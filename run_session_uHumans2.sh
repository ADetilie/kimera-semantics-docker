#!/bin/bash 
xhost +local:root

docker run --name="ros_kimera_semantics" --rm \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $HOME/.Xauthority:/root/.Xauthority \
-v $(pwd):/tmp/kimera-semantics-custom \
--privileged \
--net=host \
kimera_semantics_custom:kimera_semantics_installed \
./tmp/kimera-semantics-custom/scripts/start_simulation_uHumans2.sh

xhost -local:root
