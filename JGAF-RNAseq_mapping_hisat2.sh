#!/bin/bash
#SBATCH --partition=fast
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=2000
#SBATCH --job-name="RNAseq_aln"
#SBATCH --output=Lsat_RNAseq_aln-%j.out


# Modules needed ###############################################################
module load hisat2
module load samtools
module load freebayes
module load vcftools

# Refence genome ###############################################################
hisat2-build \
Lsat_mtDNA/Lsat_mtDNA.fasta \
Lsat_mtDNA/index

################################################################################
mkdir SRR085107

##SRR085107##
hisat2 \
-q \
-x Lsat_mtDNA/index \
--mp 2.0 \
-U SRR085107/SRR085107.fastq.gz  \
-S SRR085107/SRR085107.mapped_reads.sam
samtools view -b \
SRR085107/SRR085107.mapped_reads.sam \
> SRR085107/SRR085107.mapped.bam

freebayes -f Lsat_mtDNA/Lsat_mtDNA.fasta \
SRR085107/SRR085107.mapped.bam > SRR085107/SRR085107.var.vcf

vcftools \
--vcf SRR085107/SRR085107.var.vcf \
--remove-indels \
--recode \
--recode-INFO-all \
--out SRR085107/SRR085107.SNPs.txt
