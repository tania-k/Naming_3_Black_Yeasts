#!/usr/bin/bash -l

#SBATCH --nodes 1 --ntasks 2 -p batch --mem 8gb --out logs/IQtree.%A.log --time 1-12:00:00

module load IQ-TREE/3.0.1
module load vcftools
module unload perl
#module unload miniconda2
module load miniconda3

iqtree3 -nt 2 -s aln/rDNA/BT2.aln.clipkit -b 1000 -redo
