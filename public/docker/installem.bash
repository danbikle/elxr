#!/bin/bash

# ~/ub18g/installem.bash

# This script should install Git, Docker, and other useful packages.

apt update
apt -y upgrade
apt -y install git
apt -y install docker.io
apt -y install ifupdown aufs-tools debootstrap docker-doc rinse zfs-fuse
echo On AWS, and/or Oracle Cloud, do this:
echo usermod -G docker ubuntu
echo shutdown -r now

exit
