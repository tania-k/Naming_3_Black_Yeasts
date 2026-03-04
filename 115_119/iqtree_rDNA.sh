#!/usr/bin/bash -l
#SBATCH -p epyc -N 1 -n 6 --mem 120gb --out rDNA.iqtree_%A.log
#SBATCH --time 10:00:00

module load iqtree
module load miniconda3
conda activate /bigdata/stajichlab/shared/condaenv/phyling

if [ ! -s 115_119.rDNA_multi.partitioned.treefile ]; then
iqtree3 -s 115_119.rDNA_multi.mfa -p 115_119_multi.partitions.nex -nt AUTO -pre 115_119.rDNA_multi.partitioned -B 1000 -m MFP+MERGE
fi

perl PHYling_unified/util/rename_tree_nodes.pl 115_119.rDNA_multi.partitioned.treefile prefix.tab > 115_119.rDNA_multi.partitioned.long_names.tre
