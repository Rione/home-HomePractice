#!/bin/sh

set -eu

# https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu20.04_desktop
curl -sLf https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu20.04_desktop/raw/master/step1.bash | bash

[ -d ~/catkin_ws/src ] || mkdir -p ~/catkin_ws/src
