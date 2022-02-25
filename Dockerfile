FROM gimel12/benchmarks2022:latest 



COPY . /workspace/benchmark

# run a python file in the container 
RUN python3 /workspace/benchmark/benchmark.py
