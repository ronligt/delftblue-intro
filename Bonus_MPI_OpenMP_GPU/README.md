# Usage

```bash
chmod +x compile_everything.sh 
./compile_everything.sh
sbatch pi_serial.slurm
sbatch pi_openmp.slurm
sbatch pi_mpi.slurm
sbatch pi_cuda.slurm
```

# What it does

Calculates number pi using [Leibniz series](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80)

$$
\frac{\pi}{4} = 1-\frac{1}{3}+\frac{1}{5}-\frac{1}{7}+\frac{1}{9}-\cdots = \sum_{k=0}^{\infty}\frac{(-1)^k}{2k+1}.
$$

Folder contains four implementations: serial, OpenMP, MPI, and CUDA.

The problem is trivially parallelizable, because all members of the series are independent.
