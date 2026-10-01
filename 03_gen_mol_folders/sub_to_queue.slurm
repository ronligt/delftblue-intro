#!/bin/bash
#
#SBATCH --job-name="gen_mol"
#SBATCH --time=00:05:00
#SBATCH --partition=compute-p1,compute-p2
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1GB
#SBATCH --account=education-eemcs-courses-linuxcli

# Run Python script:
module load 2026
module load cpu
module load python
module load py-numpy
module load py-scipy
module load py-matplotlib

source my-ase-env/bin/activate
srun python3 gen_mol_folders.py
