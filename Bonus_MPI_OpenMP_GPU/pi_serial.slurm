#!/bin/bash

#SBATCH --job-name="pi-cpu-serial"
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=3GB
#SBATCH --account=Education-EEMCS-Courses-LinuxCLI

srun pi_serial.x 
