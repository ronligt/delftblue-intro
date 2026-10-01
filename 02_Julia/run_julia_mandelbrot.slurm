#!/bin/bash 
#
#SBATCH --job-name="julia"
#SBATCH --time=00:05:00
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --account=education-eemcs-courses-linuxcli

module load julia 

srun julia mandelbrot.jl
