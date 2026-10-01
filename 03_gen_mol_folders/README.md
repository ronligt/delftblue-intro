# Usage

```bash
chmod +x install_ase.sh
./install_ase.sh
sbatch sub_to_queue.slurm
```

# What it does

- Installs Python ASE package in a new virtual environment
- Submits a job
- Creates text output, but also a folder called "molecules" with a bunch of sub-folders containing simulation results.
