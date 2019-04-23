export surface="111_3"   #or "110" or "111" later on
jdftx -ni testGeometry.in | tee testGeometry-${surface}.out
createXSF testGeometry-${surface}.out ${surface}.xsf

