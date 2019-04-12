#!/bin/bash
#SBATCH --partition=nodes
#SBATCH --job-name=Pt_Surf110_1_solv
#SBATCH --output=Pt_Surf110_1_solv_%a.txt
#SBATCH --array=1-2
#SBATCH --exclude=node[1001-1032]
#SBATCH --export=surface=110_1

declare -a commands

commands[1]="/home/jfm343/JDFTXDIR/build/jdftx -i Vacuum.in | tee ${surface}-Vacuum.out; /home/jfm343/JDFTXDIR/build/jdftx -i Solvated.in | tee ${surface}-Solvated.out"
commands[2]="echo done"
bash -c "${commands[${SLURM_ARRAY_TASK_ID}]}"
