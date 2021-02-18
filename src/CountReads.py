import csv
from functools import reduce
import pandas as pd
from pandas import DataFrame
import numpy as np


def parseSamFile(sam_file,isolate_file,output_path):


    # The max number of columns in the sam file
    largest_column_count = 0

    # Loop through each line of sam file
    with open(sam_file, 'r') as temp_f:
        lines = temp_f.readlines()

        for l in lines:
            # Column count for each linne
            column_count = len(l.split('\t')) + 1
            

            # Find the largest number of columns
            largest_column_count = column_count if largest_column_count < column_count else largest_column_count

    # Close file
    temp_f.close()

    # Generate column names (will be 0, 1, 2, ..., largest_column_count - 1)
    column_names_1 = ["QNAME","FLAG","RNAME","POS","MAPQ","CIGAR","RNEXT","PNEXT","TLEN","SEQ","QUAL"]
    column_names_2 = [str(i) for i in range(len(column_names_1), 22)]
    column_names = column_names_1+column_names_2


    # Read samfil using column names defined 
    samfile = pd.read_csv(sam_file, header=None, delimiter='\t', names=column_names, dtype = str)

    # Exclude Header from sam file
    samples = samfile[samfile['QNAME'].str.contains('SRR')]
    samples = samples[['QNAME','RNAME']]
    
    # Exclude fragment value from QNAME
    samples['QNAME'] = samples['QNAME'].str.split('.').str[0]
    
    # Read references file and take only RNAME
    references = pd.read_csv(isolate_file, header=None, delimiter='\t', usecols=[3], names=["RNAME"])
    
    print(len(references['RNAME'].unique()))
    print(len(samples['RNAME'].unique()))
    
    #Find which reference isolates exist in referennces file but not in sam file
    common = references.merge(samples, on=["RNAME"])
    references_extra = references[~references.RNAME.isin(common.RNAME)]

    references_extra.to_csv(output_path+"/references_extra.csv")  

    return samples, references_extra


def countReads(samples_dataframe,references, output_path):

    # Count number of occurances of each sample/reference pair, return as array
    sample_counts = samples_dataframe.value_counts(["QNAME", "RNAME"])
    sample_counts = sample_counts.unstack(level=1)
    # Get all references which are not already present in dataframe and add as count 0
    new_ref = references['RNAME'].unique().tolist()
    sample_counts_all = sample_counts.assign(**dict.fromkeys(new_ref, '0'))


    sample_counts_all.to_csv(output_path+"/sample_counts.csv")
    return sample_counts_all
    

def main():


    #readCounts(['SRR5651391'],'/Users/brooksantangelo/Documents/Methods7712/Module1/Hackathon1/Repo/data/Fastq/')
    samples,references_extra = parseSamFile("/Users/brooksantangelo/Documents/Methods7712/Module1/Hackathon1/Repo/data/Fastq/SRR5651391.sam","/Users/brooksantangelo/Documents/Methods7712/Module1/Hackathon1/Repo/data/Ruminococcus_gnavus/Ruminococcus_gnavus_pangenome.tsv","/Users/brooksantangelo/Documents/Methods7712/Module1/Hackathon1/")

    sample_counts = countReads(samples,references_extra,"/Users/brooksantangelo/Documents/Methods7712/Module1/Hackathon1")
    
if __name__ == '__main__':
    main()
