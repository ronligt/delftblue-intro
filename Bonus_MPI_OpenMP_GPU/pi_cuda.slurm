#!/bin/bash

#SBATCH --job-name="pi-cpu-cuda"
#SBATCH --partition=gpu-a100-small,gpu-a100,gpu-v100
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=1
#SBATCH --mem-per-cpu=3GB
#SBATCH --account=Education-EEMCS-Courses-LinuxCLI

module load cuda 

srun pi_cuda.x 
