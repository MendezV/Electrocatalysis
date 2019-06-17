#!/bin/bash
for surface in 100_1; do
    export surface
    jdftx -i Vacuum.in | tee ${surface}-Vacuum.out
    jdftx -i Solvated.in | tee ${surface}-Solvated.out
done
