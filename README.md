# Naming_3_Black_Yeasts

This repository helps describe the steps taken to complete the work in our publication.

We are fortunate there are many genomes and genes available on NCBI to  pull and use in our phylogenetic trees.

Full acceptance from the Cahuilla tribe to use their language and their demi-god Taxawa tesnikish in our naming schema.

112 - Neophaeococcomyces mojaviensis

115 - Coniosporium tulheliweneti

119 - Taxawa tesnikishi

## Two folders

* 112

* 115

## In each folder you can find the sequences in aln/rDNA specifically with four different genes, beta-tubulin (BT2), calmodulin (CAM), Internal Transcribed Spacer (ITS), Large Ribosomal Subunit (LSU)

Steps include: 

* Collecting sequences from NCBI for BT2, CAM, ITS, LSU
* Taking .fna file and running MUSCLE to align the genes
* Passing the alignment file through CLIPKIT
* IQTREE3 was run on each aligned and clipped gene sequences (iqtree.sh)
** iqtree3 -nt 2 -s aln/rDNA/GENE.aln.clipkit -b 1000 -redo
** This way you can determine the best fit model for each gene and add them to the NEXUS file to create the proper partitions
* Next steps include running (PHYling_unified/util/combine_multiseq_aln.py) using the nexus partitions
* Finally run another IQTREE3 step on the combined alignment. (iqtree_rDNA.sh)
** Ensure you have a prefix.tab file prepared that has a tab deliminated file which will take your organism headers to change all their names at once.
** Run the last step PHYling_unified/util/rename_tree_nodes.pl (also found in iqtree_rDNA.sh)
