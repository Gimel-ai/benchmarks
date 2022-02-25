#!/bin/bash 

sudo git clone https://github.com/Gimel-ai/benchmarks.git
cd benchmarks
sudo docker build . -t bizon/benchmark2022:v2.0


sudo docker run --gpus all -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm bizon/benchmark2022:v2.0