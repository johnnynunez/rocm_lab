#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export FORCE_CUDA=1

# build torchvision

git clone --recursive -b release/0.18.1 https://github.com/pytorch/vision.git torchvision

cd torchvision
echo 0.17.2 > version.txt

pip install setuptools wheel cmake ninja 

python setup.py bdist_wheel

cd ..
