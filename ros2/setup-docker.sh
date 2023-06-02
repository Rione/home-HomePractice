#!/bin/sh

set -eu

sudo apt update -y
sudo apt install -y docker.io remmina

sudo usermod -a -G docker $USER

printf "====================

Docker installation is done!
Run
\$ restart
in terminal to restart your computer and start using docker!

====================\n"
