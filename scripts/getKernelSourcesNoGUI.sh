#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
wget https://developer.nvidia.com/embedded/dlc/l4t-jetson-xavier-driver-package-31-1-0 -O public_sources.tbz2
sudo tar -xvf public_sources.tbz2 public_release/kernel_src.tbz2
tar -xvf public_release/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r public_release
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

