#!/bin/bash

#SBATCH --job-name="pi-cpu-mpi"
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --time=00:05:00
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=3GB
#SBATCH --account=Education-EEMCS-Courses-LinuxCLI

module load 2026
module load cpu
module load openmpi

srun pi_mpi.x 
