# fmdv_de_novo
A collection of bash scripts allowing for automated de novo assembly of FMDV paired-end Illumina data. 

A bunch of bash scripts which allow for (mostly) automated de novo assembly of Illumina paired-end reads from multiple samples. Generated some years ago and published here for a purpose of a doctoral dissertation. Obsolete, however feel free to clone if of use. Contains FMDV genomic database (see data directory) obtained from Pirbright’s https://www.fmdbase.org/ in 2023, which is used to filter FMDV contigs. Dependencies: spades (SPAdes-3.15.5 or later), seqkit, fastqc, fastq_screen, scaffold_builder.py, mafft, bwa which you need to install (many available via conda). Scripts assume that all dependencies and FMDV database are in your path or the current directory.

Step 1: ORGANISE FASTQ FILES
1) Run organise_fastq_files.bsh
Creates link to the data,
Creates a master directory with the current date,
Creates a sub-directory for each isolate,
Copies fastq files into an appropriate directory. 

Step 2: DE NOVO ASSEMBLY CONTIGS
1) If needed, activate appropriate (de_novo_assembly) conda environment.
2) Run de_novo_assembly.bsh
The script processes each isolate-specific directory where:
Check quality of the reads
Filters the reads based on quality
Filters out contaminants and host reads
De novo assembles contigs 
Filters out non-FMDV contigs

Step 3: SCAFFOLD CONTIGS INTO LONGER SEQUENCES
1) If needed, activate appropriate conda environment.
2) Run scaffolding.bsh
The script processes each isolate-specific directory where:
Identifies the closest isolate from FMDV reference genomes.
Based on that closest reference, scaffolds contigs into a scaffold (usually > 7500 nts).
Aligns scaffolded sequences to the closest isolate from FMDV reference genomes.

Step 4: PUT SCAFFOLDS TOGETHER INTO WG CONSENSUS
Using AliView ensure that all genome is reconstructed.
Generate consensus from the scaffolds. 
Run place_fasta_into_dir.bsh which will place consensus sequence files into appropriate directories.
Note consensus files should be named [isolate_name]_*_final.fa

Step 5: MAP READS TO THE DE NOVO ASSEMBLED GENOME
1) If needed, activate appropriate conda environment.
2) Load R/latest module to run the R script.
3) Run map_reads_to_consensus.bsh
The scripts maps reads to the de novo consensus
Based on the mapped reads the script generate final consensus.
The scripts plots a coverage per genome position. 
4) The mapped reads can be visualised using Integrative Genomics Viewer (IGV).

   

