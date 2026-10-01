#!/bin/bash

#SBATCH --job-name="pi-cpu-openmp"
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=3GB
#SBATCH --account=Education-EEMCS-Courses-LinuxCLI

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
srun pi_openmp.x 
