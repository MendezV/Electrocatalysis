#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=Pt_100_Methanol_ORR
#SBATCH --mem=1
#SBATCH --output=water_%a.txt
#SBATCH --array=1-3
#SBATCH --exclude=node30[01-03]


declare -a commands

commands[1]="export surface="100_1"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"
commands[2]="export surface="100_2"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"
commands[3]="export surface="100_3"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"

bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"
