#!/bin/bash

## This script maps the sample reads to the Ruminococcus gnavus genome database

## TODO: parameterize 

# ## rg =  path to reference genomes
# ## sra = sra 

# while getopts rg:sra:f: flag
# do
#     case "${flag}" in
#         rg) reference_genome=${OPTARG};;
#         sra) sra=${OPTARG};;
#         o) output=${OPTARG};;
#     esac
# done

echo "READ SRR5651393"
bowtie2 -x ./data/Ruminococcus_gnavus/Ruminococcus_gnavus --sra-acc SRR5651393 -S ./data/mapped_reads/SRR5651393.sam

echo "READ SRR5651392"
bowtie2 -x ./data/Ruminococcus_gnavus/Ruminococcus_gnavus --sra-acc SRR5651392 -S ./data/mapped_reads/SRR5651392.sam

echo "READ SRR5651391"
bowtie2 -x ./data/Ruminococcus_gnavus/Ruminococcus_gnavus --sra-acc SRR5651391 -S ./data/mapped_reads/SRR5651391.sam
echo "task complete"