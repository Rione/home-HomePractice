#!/bin/sh

set -eu

sudo apt update -y
sudo apt install -y curl

# https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu20.04_desktop
curl -sLf https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu20.04_desktop/raw/master/step1.bash | bash

[ -d ~/catkin_ws/src ] || mkdir -p ~/catkin_ws/src

grep -F "[ -f ~/catkin_ws/devel/setup.bash ] && source ~/catkin_ws/devel/setup.bash" ~/.bashrc ||
    echo "[ -f ~/catkin_ws/devel/setup.bash ] && source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
