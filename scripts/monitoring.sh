#!/bin/sh

curl -O https://github.com/ilya-zlobintsev/LACT/releases/download/test-build/lact-0.6.1-0.amd64.ubuntu-2404.deb
sudo apt install ./lact-0.6.1-0.amd64.ubuntu-2404.deb -y
sudo systemctl enable --now lactd
