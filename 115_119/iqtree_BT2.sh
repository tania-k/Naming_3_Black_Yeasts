#!/usr/bin/bash -l

#SBATCH --nodes 1 -n 1 -c 2 --mem 8gb --out logs/IQtree_BT2.%A.log -J iqBT2

module load iqtree/3.0.1

iqtree3 -nt 2 -s aln/rDNA/BT2.aln.clipkit -b 1000 -alrt 1000
