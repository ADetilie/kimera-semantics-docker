#!/bin/bash
ROS_DISTRO=melodic # Change `melodic` to your ROS distro

# Add default DNS server as GoogleDNS
sudo echo 'nameserver 8.8.8.8' > /etc/resolv.conf

# Setup catkin workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin init
catkin config --extend /opt/ros/$ROS_DISTRO 
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin config --merge-devel

# Add workspace to bashrc.
echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc

# Clone repo
cd ~/catkin_ws/src
#git clone git@github.com:MIT-SPARK/Kimera-Semantics.git
git clone https://github.com/MIT-SPARK/Kimera-Semantics.git

# Install dependencies from rosinstall file using wstool
wstool init # Use unless wstool is already initialized

# Optionally add Kimera-Semantics to the rosinstall file
#wstool scrape

# For ssh:
#wstool merge Kimera-Semantics/install/kimera_semantics_ssh.rosinstall
# For https:
wstool merge Kimera-Semantics/install/kimera_semantics_https.rosinstall

# Download and update all dependencies
wstool update

# ---------------------------
# BUILD
# ---------------------------

# Compile code
catkin build kimera_semantics_ros

# Refresh workspace
source ~/catkin_ws/devel/setup.bash
