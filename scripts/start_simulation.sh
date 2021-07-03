#!/bin/bash
echo "===Start simulation==="

echo "- Setup"
source ~/catkin_ws/devel/setup.bash 

# create link to *.bag file to use it as input
echo "- Create link to *.bag file"
ln -vs /tmp/kimera-semantics-custom/Input_Output/kimera_semantics_demo.bag ~/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/rosbags/

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
mv /root/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/mesh_results/*.ply /tmp/kimera-semantics-custom/Input_Output && \
echo "Mesh saved succesfully" || \
echo "Mesh creation failed"

echo "===Finish simulation==="
