#!/bin/bash 
xhost +local:root

docker run --name="ros_kimera_semantics"--rm \
-e DISPLAY=$DISPLAY \
-v $XSOCK:$XSOCK \
-v $HOME/.Xauthority:/root/.Xauthority \
-v $(pwd)/Input_Output:/tmp/kimera-semantics-Input_Output \
--privileged \
--net=host \
kimera_semantics_custom:start_kimera_semantics_entrypoint

xhost -local:root
