#!/bin/bash 
xhost +local:root

docker run --name="ros_kimera_semantics" --rm \
-it \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $HOME/.Xauthority:/root/.Xauthority \
-v $PWD:/tmp/kimera-semantics-custom \
--privileged \
--net=host \
kimera_semantics_custom:kimera_semantics_installed \
/bin/bash

xhost -local:root
