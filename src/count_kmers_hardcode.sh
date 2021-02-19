#!/bin/bash


echo "Counting all"
# convert fastq from sra file and count kmers for all reads in samples
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651391_all.jf -F   2 <(./src/sratoolkit.2.10.9-ubuntu64/bin/fastq-dump -Z ./data/sra_files/SRR5651391.sra)

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651391_all.jf > ./data/kmer_counts/SRR5651391_all.txt

echo "Converting sam"
# convert sam file into fastq file
samtools fastq ./data/mapped_reads/SRR5651391.sam -o ./data/mapped_reads/SRR5651391.fq

echo "Counting mapped"
# count kmers from mapped reads in sample
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651391_mapped.jf ./data/mapped_reads/SRR5651391.fq

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651391_mapped.jf > ./data/kmer_counts/SRR5651391_mapped.txt 
echo "Done"


echo "Counting all"
# convert fastq from sra file and count kmers for all reads in samples
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651392_all.jf -F   2 <(./src/sratoolkit.2.10.9-ubuntu64/bin/fastq-dump -Z ./data/sra_files/SRR5651392.sra)

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651392_all.jf > ./data/kmer_counts/SRR5651392_all.txt

echo "Converting sam"
# convert sam file into fastq file
samtools fastq ./data/mapped_reads/SRR5651392.sam -o ./data/mapped_reads/SRR5651392.fq

echo "Counting mapped"
# count kmers from mapped reads in sample
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651392_mapped.jf ./data/mapped_reads/SRR5651392.fq

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651392_mapped.jf > ./data/kmer_counts/SRR5651392_mapped.txt 
echo "Done"



echo "Counting all"
# convert fastq from sra file and count kmers for all reads in samples
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651393_all.jf -F   2 <(./src/sratoolkit.2.10.9-ubuntu64/bin/fastq-dump -Z ./data/sra_files/SRR5651393.sra)

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651393_all.jf > ./data/kmer_counts/SRR5651393_all.txt

echo "Converting sam"
# convert sam file into fastq file
samtools fastq ./data/mapped_reads/SRR5651393.sam -o ./data/mapped_reads/SRR5651393.fq

echo "Counting mapped"
# count kmers from mapped reads in sample
jellyfish count -m 4 -s 100M -o ./data/kmer_counts/SRR5651393_mapped.jf ./data/mapped_reads/SRR5651393.fq

echo "Converting to delim"
# convert .jf file into tab delimited text file for downstream analysis
jellyfish dump -c ./data/kmer_counts/SRR5651393_mapped.jf > ./data/kmer_counts/SRR5651393_mapped.txt 
echo "Done"
