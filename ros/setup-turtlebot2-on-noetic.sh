#!/bin/sh

# Initial commit by Hara-kun

# TODO
# fix cannot launch node of laptop_battery_monitor/laptop_battery.py error when launching
# roslaunch turtlebot_bringup minimal.launch

set -eu

UBUNTU_VER=$(lsb_release -sc)
[ "$UBUNTU_VER" = "focal" ] || exit 1

sudo apt update -y

sudo apt install -y \
    ros-noetic-joy \
    ros-noetic-ecl-build \
    ros-noetic-ecl-threads \
    ros-noetic-ecl-geometry \
    ros-noetic-ecl-console \
    ros-noetic-ecl-mobile-robot \
    ros-noetic-ecl-devices \
    ros-noetic-ecl-sigslots \
    ros-noetic-ecl-command-line \
    ros-noetic-ecl-streams \
    ros-noetic-base-local-planner \
    ros-noetic-move-base \
    ros-noetic-kobuki-ftdi \
    ros-noetic-rgbd-launch \
    ros-noetic-urdf \
    ros-noetic-rqt-robot-dashboard \
    ros-noetic-kdl-conversions \
    ros-noetic-gazebo-ros \
    ros-noetic-gazebo-plugins \
    ros-noetic-interactive-markers \
    ros-noetic-xacro \
    ros-noetic-rqt-plot \
    ros-noetic-robot-state-publisher \
    ros-noetic-diagnostic-aggregator \
    ros-noetic-rviz \
    ros-noetic-gmapping \
    ros-noetic-rqt \
    ros-noetic-joint-state-publisher

sudo apt install -y \
    python3-vcstool \
    libusb-dev \
    libftdi-dev \
    pyqt5-dev-tools

# clean source if it exists
[ -d ~/catkin_ws/src/turtlebot2 ] && rm -rf ~/catkin_ws/src/turtlebot2

mkdir -p ~/catkin_ws/src/turtlebot2
cd ~/catkin_ws/src/turtlebot2

# turtlebot2
git clone --depth 1 https://github.com/turtlebot/turtlebot.git
git clone --depth 1 https://github.com/turtlebot/turtlebot_msgs.git
git clone --depth 1 https://github.com/turtlebot/turtlebot_simulator
git clone --depth 1 https://github.com/turtlebot/turtlebot_apps.git

# fix error with using old python
sed -i "s,#!/usr/bin/env python,#!/usr/bin/env python3,g" turtlebot/turtlebot_teleop/scripts/turtlebot_teleop_key
# find ~/catkin_ws/src/turtlebot2 -name "*.py" | xargs -I@ sed -i "s,#!/usr/bin/env python,#!/usr/bin/env python3,g" @

# kobuki
git clone --depth 1 https://github.com/yujinrobot/kobuki_msgs.git
git clone --depth 1 --branch melodic https://github.com/yujinrobot/kobuki.git
git clone --depth 1 --branch melodic https://github.com/yujinrobot/kobuki_desktop.git

# yocs_controllers
git clone --depth 1 https://github.com/yujinrobot/yujin_ocs.git
git clone --depth 1 https://github.com/yujinrobot/yocs_msgs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs/

# viz
git clone -b indigo https://github.com/turtlebot/turtlebot_viz.git

# kobuki_core
git clone -b melodic https://github.com/yujinrobot/kobuki_core.git

# ecl_*
git clone --depth 1 -b release/0.61-noetic https://github.com/stonier/ecl_tools.git
git clone --depth 1 -b release/0.61-noetic https://github.com/stonier/ecl_lite.git
git clone --depth 1 -b release/0.62-noetic https://github.com/stonier/ecl_core.git
git clone --depth 1 -b release/0.60-melodic https://github.com/stonier/ecl_navigation.git

echo "Building... This might take few minutes"
sleep 5s

cd ~/catkin_ws
catkin_make

printf "
====================

Turtlebot setup is done!
Open 2 terminals.

Run
\$ roslaunch turtlebot_bringup minimal.launch
on your first terminal.

Run
\$ roslaunch turtlebot_teleop keyboard.launch
on second terminal.

You should be able to move your turtlebot with keyboard! :)

You might want to run
\$source ~/catkin_ws/devel/setup.bash
if some error occurs.

====================\n"
