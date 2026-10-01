#!/bin/bash

# Install ASE:
module load 2026
module load cpu
module load python
module load py-pip
module load py-numpy
module load py-scipy
module load py-matplotlib

python3 -m venv my-ase-env
source my-ase-env/bin/activate
python3 -m pip install ase
