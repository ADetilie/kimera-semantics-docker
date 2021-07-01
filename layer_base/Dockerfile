# use prepared image as base
FROM ros:melodic-perception

# install all dependencies
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y python-wstool python-catkin-tools  protobuf-compiler autoconf
RUN apt-get install -y build-essential libtool

