#!/bin/bash
#
#SBATCH --job-name="PyTorch"
#SBATCH --time=00:05:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=1
#SBATCH --partition=gpu-a100-small,gpu-a100,gpu-v100
#SBATCH --mem-per-cpu=3G
#SBATCH --account=Education-EEMCS-Courses-LinuxCLI

module load 2026
module load gpu
module load openmpi
module load py-torch

srun python3 test_pytorch_gpus.py
