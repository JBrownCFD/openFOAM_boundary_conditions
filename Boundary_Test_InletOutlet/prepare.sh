#! /bin/bash
. /usr/lib/openfoam/openfoam2112/etc/bashrc

rm -r processor*

blockMesh
topoSet
createPatch -overwrite
decomposePar
mpirun -n 8 renumberMesh -parallel -overwrite |tee renumbermesh.out
mpirun -n 8 interFoam -parallel