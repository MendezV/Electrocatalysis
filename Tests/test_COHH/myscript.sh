#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=pt-C(OH)H
#SBATCH --mem=1
#SBATCH --output=water_%a.txt
#SBATCH --array=1-2
#SBATCH --exclude=node30[01-03]


declare -a commands

commands[1]="jdftx -i Neutral.in -o Neutral.out"
bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"

