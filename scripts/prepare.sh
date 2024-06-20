#!/bin/sh

sudo apt-get update && sudo apt-get install -y git vim curl build-essential python3-pip python3-venv libpython3-dev libpng-dev libjpeg-dev clang clang-format clang-tidy cmake

curl -O https://repo.radeon.com/amdgpu-install/6.1.3/ubuntu/jammy/amdgpu-install_6.1.60103-1_all.deb
sudo apt install ./amdgpu-install_6.1.60103-1_all.deb

DEBIAN_FRONTEND=noninteractive amdgpu-install --usecase=graphics,rocm -y
sudo usermod -a -G render,video $LOGNAME
