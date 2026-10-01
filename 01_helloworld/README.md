# Hello World example

## Usage

```bash
sbatch helloworld.slurm
```

or

```bash
sbatch helloworld2nodes.slurm
```

## What it does

Prints names of all nodes to which requested CPUs were allocated and saves them either to a newly created .txt file or to a slurm-XXXXXX.out file.

## What we learn

How to allocate resources; requesting specific numbers of nodes/tasks/cpus.
