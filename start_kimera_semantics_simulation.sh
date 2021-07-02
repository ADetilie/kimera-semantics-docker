#!/bin/bash
source ~/catkin_ws/devel/setup.bash

# copy *.bag file to use it as input
cp /tmp/kimera-semantics-custom/Input_Output/kimera_semantics_demo.bag /root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/rosbags/

# start ROS and related applications
roscore & > /dev/null 2>&1 &
sleep 5
roslaunch kimera_semantics_ros kimera_semantics.launch play_bag:=true > /dev/null 2>&1 &
# roslaunch kimera_semantics_ros kimera_semantics_uHumans2.launch play_bag:=true > /dev/null 2>&1 &
sleep 5
rviz -d $(rospack find kimera_semantics_ros)/rviz/kimera_semantics_gt.rviz
# rviz -d $(rospack find kimera_semantics_ros)/rviz/kimera_semantics_uHumans2.rviz

# save mesh from kimera_semantics and save it as *.ply file
rosservice call /kimera_semantics_node/generate_mesh
cp /root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/mesh_results/*.ply /tmp/kimera-semantics-custom/Input_Output
