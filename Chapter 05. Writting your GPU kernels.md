# Path of the program
code -> CPU -> GPU -> GPU compute -> CPU -> output

# Naming scheme

* `h_A` refers to host (CPU) for variable name “A”

* `d_A` refers to device (GPU) for variable name “A” 

- `**__host__**`: Runs on the CPU, called from the CPU.
- `**__device__**`: Runs on the GPU, called from other GPU code (`__device__` or `__global__`).
- `**__global__**`: Runs on the GPU, called from the CPU (via `<<<...>>>`).

 if CPU code wants to run a `__device__` function, it launches a `__global__` kernel on the GPU, and that kernel calls the `__device__` function. but if we can also copmile device and host at the same time so no need a middle man

- **Dynamic Parallelism (modern GPUs):** A `__global__` kernel can also launch another `__global__` kernel on the GPU when Dynamic Parallelism is enabled, though CPU-to-`__global__` is still the standard entry point.
- **`__host__ __device__` together:** If you mark a function with both, it compiles for both CPU and GPU so either side can call it directly without going through a kernel wrapper.
# Memory Management
* `cudaMalloc` is memory on VRAM (also called global memory)
* `cudaMemcpy` copy from device to host, host to device, device to device 
* `cudaFree` free memory on device
# NVCC
* Host code