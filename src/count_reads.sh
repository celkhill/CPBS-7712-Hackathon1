#!/bin/bash


while getopts k:s: option
do
case "${option}"
in
k) Kmer=${OPTARG};;
s) SAMPLE=${OPTARG};;
esac
done

echo "Counting all"
# convert fastq from sra file and count kmers for all reads in samples
jellyfish count -m $Kmer -s 100M -o ./data/read_counts/$SAMPLE_all.jf -F   2 <(./src/sratoolkit.2.10.9-ubuntu64/bin/fastq-dump -Z ./data/sra_files/$SAMPLE.sra)

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/read_counts/$SAMPLE_all.jf > ./data/read_counts/$SAMPLE_all.txt

echo "Converting sam"
# convert sam file into fastq file
samtools fastq ./data/mapped_reads/$SAMPLE.sam -o ./data/mapped_reads/$SAMPLE.fq

echo "Counting mapped"
# count kmers from mapped reads in sample
jellyfish count -m 8 -s 100M -o ./data/read_counts/$SAMPLE_mapped.jf ./data/mapped_reads/$SAMPLE.fq

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/read_counts/$SAMPLE_mapped.jf > ./data/read_counts/$SAMPLE_mapped.txt 

echo "Done"
