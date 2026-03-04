#!/usr/bin/bash -l
#SBATCH -N 1 -n 6 --mem 120gb --out rDNA.iqtree_%A.log --time 1-00:00:00

module load iqtree
module load miniconda3
conda activate /bigdata/stajichlab/shared/condaenv/phyling

if [ ! -s 112.rDNA_multi.partitioned.treefile ]; then
iqtree3 -s 112.rDNA_multi.mfa -p 112_multi.partitions.nex -nt AUTO -pre 112.rDNA_multi.partitioned -B 1000 -m MFP+MERGE
fi

perl PHYling_unified/util/rename_tree_nodes.pl 112.rDNA_multi.partitioned.treefile prefix.tab > 112.rDNA_multi.partitioned.long_names.tre
