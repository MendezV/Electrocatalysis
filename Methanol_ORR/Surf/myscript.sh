#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=Pt_Surf_solv
#SBATCH --mem=1
#SBATCH --output=Pt_Surf_solv_%a.txt
#SBATCH --array=1-2
#SBATCH --exclude=node[1001,1004,1006,1011,1016,1024,1031-1032]
#SBATCH --exclude=node[1002-1003,1007-1010,1012-1015,1017-1023,1025-1030]
#SBATCH --export=surface=100

declare -a commands

commands[1]="jdftx -i Vacuum.in | tee ${surface}-Vacuum.out; jdftx -i Solvated.in | tee ${surface}-Solvated.out"
commands[2]="echo done"
bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"
