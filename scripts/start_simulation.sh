#!/bin/bash
echo "===Start simulation==="

echo "- Setup"
source ~/catkin_ws/devel/setup.bash 

# start ROS and related applications
echo "- Start roscore"
roscore & > /dev/null 2>&1 &
sleep 5
echo "- Play bag"
roslaunch kimera_semantics_ros kimera_semantics.launch play_bag:=true > /dev/null 2>&1 &
sleep 5
echo "- Start rviz"
rviz -d $(rospack find kimera_semantics_ros)/rviz/kimera_semantics_gt.rviz

# save mesh from kimera_semantics and save it as *.ply file
echo "- Generate mesh"
rosservice call /kimera_semantics_node/generate_mesh

echo "===Finish simulation==="
