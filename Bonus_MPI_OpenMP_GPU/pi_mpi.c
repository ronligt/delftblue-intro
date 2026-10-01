#include <stdio.h>
#include <mpi.h>


#define NPTS 9000000000  // Number of terms in the series 

int main(int argc, char *argv[]) {
    int rank, size;
    long long i;
    double local_pi = 0.0, global_pi = 0.0;
    double start_time, end_time;

    MPI_Init(&argc, &argv);                 // Initialize MPI
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);   // Get current process rank
    MPI_Comm_size(MPI_COMM_WORLD, &size);   // Get total number of processes

    start_time = MPI_Wtime();               // Start timing

    // Each process computes a portion of the series
    for (i = rank; i < NPTS; i += size) {
        double sign = (i % 2 == 0) ? 1.0 : -1.0;
        local_pi += sign / (2.0 * i + 1.0);
    }

    // Reduce all local_pi values into global_pi on rank 0
    MPI_Reduce(&local_pi, &global_pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        global_pi *= 4.0;
        end_time = MPI_Wtime();
        printf("pi = %.15f\n", global_pi);
//        printf("time = %f seconds, MPI parallel execution\n", end_time - start_time);
        printf("time = %f seconds, MPI, processes = %d\n",(end_time - start_time),size);
    }

    MPI_Finalize();  // Finalize MPI
    return 0;
}

