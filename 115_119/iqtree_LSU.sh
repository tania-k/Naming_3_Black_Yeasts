#!/usr/bin/bash -l

#SBATCH --nodes 1 -n 1 -c 2 --mem 8gb --out logs/IQtree_LSU.%A.log -J iqLSU --time 1-00:00:00

module load iqtree/3.0.1

iqtree3 -nt 2 -s aln/rDNA/LSU.aln.clipkit -b 1000 -alrt 1000 --redo
