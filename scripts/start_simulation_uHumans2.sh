#!/bin/bash
echo "===Start simulation==="

echo "- Setup"
source ~/catkin_ws/devel/setup.bash

# start ROS and related applications
echo "- Start roscore"
roscore & > /dev/null 2>&1 &
sleep 5
echo "- Play bag"
roslaunch kimera_semantics_ros kimera_semantics_uHumans2.launch play_bag:=true \
semantic_label_2_color_csv_filepath:="/root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/cfg/tesse_multiscene_archviz1_segmentation_mapping.csv" > /dev/null 2>&1 &
sleep 5
echo "- Start rviz"
rviz -d $(rospack find kimera_semantics_ros)/rviz/kimera_semantics_uHumans2.rviz

# save mesh from kimera_semantics and save it as *.ply file
echo "- Generate mesh"
rosservice call /kimera_semantics_node/generate_mesh

echo "===Finish simulation==="