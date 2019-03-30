#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=pt-C(OH)H
#SBATCH --mem=1
#SBATCH --output=water_%a.txt
#SBATCH --array=1-2
#SBATCH --exclude=node30[01-03]


declare -a commands

commands[1]="jdftx -i Neutral.in -o Neutral.out"
commands[2]="for iMu in {9..10}; do
    export mu="$(echo $iMu | awk '{printf("%.4f", -0.2015+0.1*$1/27.2114)}')"
    mpirun -n 4 jdftx -i Charged.in | tee Charged$mu.out
    mv common.nbound Charged$mu.nbound
done"
bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"

