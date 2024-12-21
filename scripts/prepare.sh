#!/bin/sh

sudo apt-get update && sudo apt-get install -y git vim curl build-essential python3-pip python3-venv libpython3-dev libpng-dev libjpeg-dev clang clang-format clang-tidy cmake

curl -O https://repo.radeon.com/amdgpu-install/6.2.3/ubuntu/noble/amdgpu-install_6.2.60203-1_all.deb
sudo apt install ./amdgpu-install_6.2.60203-1_all.deb

DEBIAN_FRONTEND=noninteractive amdgpu-install --usecase=graphics,rocm -y
sudo usermod -a -G render,video $LOGNAME
