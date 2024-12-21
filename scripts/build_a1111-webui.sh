#!/bin/sh

set -ex

# taken from https://github.com/camenduru/stable-diffusion-webui-colab

apt install -y -qq git wget aria2 libcairo2-dev pkg-config python3-dev libgoogle-perftools-dev

git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d /root/stable-diffusion-webui/models/ESRGAN -o 4x-UltraSharp.pth
git clone https://github.com/camenduru/stable-diffusion-webui-images-browser /root/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /root/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet /root/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /root/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111 /root/stable-diffusion-webui/extensions/multidiffusion-upscaler-for-automatic1111
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper /root/stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper

cd /root/stable-diffusion-webui

pip install git+https://github.com/TencentARC/GFPGAN.git@7552a7791caad982045a7bbe5634bbf1cd5c8679
pip install git+https://github.com/openai/CLIP.git@a1d071733d7111c9c014f024669f959182114e33
pip install git+https://github.com/mlfoundations/open_clip.git@9eaf2424e74a4e34f5041e640e5e69bac5eb41aa

mkdir -p /root/stable-diffusion-webui/repositories

git clone https://github.com/Stability-AI/stablediffusion /root/stable-diffusion-webui/repositories/stable-diffusion-stability-ai
git clone https://github.com/CompVis/taming-transformers /root/stable-diffusion-webui/repositories/taming-transformers
git clone https://github.com/crowsonkb/k-diffusion /root/stable-diffusion-webui/repositories/k-diffusion
git clone https://github.com/sczhou/CodeFormer /root/stable-diffusion-webui/repositories/CodeFormer
git clone https://github.com/salesforce/BLIP /root/stable-diffusion-webui/repositories/BLIP

pip install -r /root/stable-diffusion-webui/repositories/CodeFormer/requirements.txt
pip install -r /root/stable-diffusion-webui/requirements.txt

# python launch.py --listen
