#!/bin/bash
#
#SBATCH --job-name="hello"
#SBATCH --time=00:05:00
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --account=education-eemcs-courses-linuxcli

echo "Hello, World!"
echo "The following nodes are reporting for duty:"
srun hostname
echo "Have a great day!"
