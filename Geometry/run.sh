#!/bin/bash
for iMu in {9..10}; do
    export mu="$(echo $iMu | awk '{printf("%.4f", -0.2015+0.1*$1/27.2114)}')"
    mpirun -n 4 jdftx -i Charged.in | tee Charged$mu.out
    mv common.nbound Charged$mu.nbound
done
