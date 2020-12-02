# RNAseq_mapping_hisat2
Mapping of RNAseq data on reference genome using Hisat2 for reduced mismatch penalties

# Determination of RNA editing sites

## Materials

### Raw reads fastq files are available on ebi.ac.uk/ena under the accession numbers:

- RNAseq data:
  - SRR080725
  - SRR085107
- Reference genome:
  - Lactuca sativa var. capitata L. nidus tenerrima:
  
## Methods

RNAseq reads were mapped on L. sativa mtDNA using Hisat2 with reduced mismatch penalties (--mp parameters to “2.0”), allowing the mapping of more reads. SAM format files were then converted to BAM format with Samtools. SNPs calling was made with Freebayes, using default parameters (see JGAF-RNAseq_mapping_hisat2.sh). SNPs were filtered to remove non C to U (or G to A) ones (see JGAF-RNAseq_mapping_hisat2.R). Finally, only SNPs in coding regions were conserved and annotated as RNA editing sites.
