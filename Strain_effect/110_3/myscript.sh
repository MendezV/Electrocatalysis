#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=Pt_110_Methanol_ORR
#SBATCH --mem=1
#SBATCH --output=water_%a.txt
#SBATCH --array=1-3
#SBATCH --exclude=node[1001,1004,1006,1011,1016,1024,1031-1032]


declare -a commands

commands[1]="export surface="110_1"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"
commands[2]="export surface="110_2"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"
commands[3]="export surface="110_3"
jdftx -i Vacuum.in | tee ${surface}-Vacuum.out"

bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"
