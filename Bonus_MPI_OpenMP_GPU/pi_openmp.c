#include <stdio.h>
#include <time.h>
#include <omp.h>

#define NPTS 9000000000  // Number of terms in the series

int main() {
    long long i;
    double pi = 0.0;
    struct timespec tstart, tend;
    double dt;

    clock_gettime(CLOCK_REALTIME, &tstart);

    #pragma omp parallel for reduction(+:pi)
    for (i = 0; i < NPTS; ++i) {
        double sign = (i % 2 == 0) ? 1.0 : -1.0;
        pi += sign / (2.0 * i + 1.0);
    }

    pi *= 4.0;  // Multiply the sum by 4 to get pi

    clock_gettime(CLOCK_REALTIME, &tend);
    dt = (tend.tv_sec + tend.tv_nsec / 1e9) - (tstart.tv_sec + tstart.tv_nsec / 1e9);

    printf("pi = %.15f\n", pi);
    printf("time = %f seconds, OpenMP, threads = %d\n",dt,omp_get_max_threads());

    return 0;
}

