CC=gcc
MPICC=mpicc
NVCC=nvcc
CFLAGS=-O3
OMPLDFLAGS=-fopenmp

all: pi_serial.x pi_openmp.x pi_mpi.x pi_cuda.x

pi_serial.x : pi_serial.c
	$(CC) $(CFLAGS) -o $@ $<

pi_openmp.x : pi_openmp.c
	$(CC) $(CFLAGS) -o $@ $< $(OMPLDFLAGS)

pi_mpi.x : pi_mpi.c
	$(MPICC) $(CFLAGS) -o $@ $<

pi_cuda.x : pi_cuda.cu
	$(NVCC) $(CFLAGS) -o $@ $<

clean:
	rm -rf *.x *.o a.out

