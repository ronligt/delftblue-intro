#include <stdio.h>
#include <cuda.h>


#define NPTS 9000000000  // Number of terms in the series
#define THREADS_PER_BLOCK 128

__global__ void compute_pi(double *partial_sums, long long npts) {
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int total_threads = gridDim.x * blockDim.x;

    double sum = 0.0;
    for (long long i = tid; i < npts; i += total_threads) {
        double sign = (i % 2 == 0) ? 1.0 : -1.0;
        sum += sign / (2.0 * i + 1.0);
    }

    partial_sums[tid] = sum;
}

int main() {

    cudaDeviceProp prop;
    int device;
    cudaGetDevice(&device);
    cudaGetDeviceProperties(&prop, device);
    printf("Running on GPU: %s\n", prop.name);

    int blocks = 1024;  // Adjust based on your GPU
    int threads = THREADS_PER_BLOCK;
    int total_threads = blocks * threads;

    double *d_partial_sums, *h_partial_sums;
    double pi = 0.0;

    size_t size = total_threads * sizeof(double);
    h_partial_sums = (double *)malloc(size);
    cudaMalloc((void **)&d_partial_sums, size);

    // Start timing
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start);

    compute_pi<<<blocks, threads>>>(d_partial_sums, NPTS);
    cudaMemcpy(h_partial_sums, d_partial_sums, size, cudaMemcpyDeviceToHost);

    for (int i = 0; i < total_threads; ++i) {
        pi += h_partial_sums[i];
    }

    pi *= 4.0;

    // Stop timing
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);

    printf("pi = %.15f\n", pi);
    printf("time = %f seconds, CUDA GPU execution\n", milliseconds / 1000.0);

    cudaFree(d_partial_sums);
    free(h_partial_sums);

    return 0;
}

