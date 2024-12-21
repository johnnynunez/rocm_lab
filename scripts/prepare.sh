#!/bin/sh

sudo apt-get update && sudo apt-get install -y git vim curl build-essential python3-pip python3-venv libpython3-dev libpng-dev libjpeg-dev clang clang-format clang-tidy cmake

sudo apt-get remove --purge '^rocm-.*' -y
sudo apt remove rocm-* -y
sudo apt purge '*rocm*' -y
sudo apt update && sudo apt full-upgrade -y
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)" -y

curl -O https://repo.radeon.com/amdgpu-install/latest/ubuntu/noble/amdgpu-install_6.3.60300-1_all.deb
sudo apt install ./amdgpu-install_6.3.60300-1_all.deb

DEBIAN_FRONTEND=noninteractive amdgpu-install --usecase=graphics,rocm -y
sudo usermod -a -G render,video $LOGNAME
