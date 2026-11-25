#include <cstdio>

__global__ void helloFromGPU() {
    printf("Hello World from GPU! (block %d, thread %d)\n",
           blockIdx.x, threadIdx.x);
}

int main() {
    printf("Hello World from CPU!\n");

    // Launch 2 blocks of 4 threads = 8 GPU threads total
    helloFromGPU<<<2, 4>>>();

    // Wait for GPU to finish before exiting (cudaDeviceSynchronize is required
    // because printf from device is asynchronous)
    cudaError_t err = cudaDeviceSynchronize();
    if (err != cudaSuccess) {
        fprintf(stderr, "CUDA error: %s\n", cudaGetErrorString(err));
        return 1;
    }

    return 0;
}
