# Requirements
- Ubuntu 18.04 or 20.04 
- Docker installed with Nvidia support (https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- Nvidia drivers installed (https://docs.nvidia.com/en-us/drivers/installation/linux-nvidia-driver-installation) 


# Installation 

Git clone this repo to the Workstation where you want to perform the tests.
go to the directory where you cloned the repo and run the following command:
```
sudo docker build -t benchmark2022
sudo docker build . -t bizon/benchmark2022:v2.0
```

Launch the container with the following command:
```
sudo docker run --gpus all -v ~/docker_workspace:/workspace/work -it --shm-size=1g --ulimit memlock=-1  --ulimit stack=67108864 --rm b5cd6dc4522
```

## Once inside the container, you can run the benchmark with the following command:



## FP32 - 200 epoch -batch size 32 Resnet50 
```
python3 /workspace/benchmark/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model=resnet50 --xla_compile=False --num_gpus=1 --batch_size=32 --num_batches=200 --all_reduce_spec=nccl --model=resnet50 --variable_update=parameter_server
```
## FP16 - 200 epoch -batch size 32 Resnet50
```
python3 /workspace/benchmark/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model=resnet50 --use_fp16 --xla_compile=False --num_gpus=1 --batch_size=32 --num_batches=200 --all_reduce_spec=nccl --model=resnet50 --variable_update=parameter_server
```
## FP16_XLA - 200 epoch -batch size 32 Resnet50
```
python3 /workspace/benchmark/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --model=resnet50 --use_fp16 --xla_compile=True --num_gpus=1 --batch_size=32 --num_batches=200 --all_reduce_spec=nccl --model=resnet50 --variable_update=parameter_server
```
