# Mapping_SNPs
map SNPs to crystal structures

Before processing and downloading the sequences from Ensembl:

Remember to convert 'X' , '*' and 'U' to 'C'

sed -i 's/X/C/g' *
sed -i 's/*/C/g' *
sed -i 's/U/C/g' *



# Library packages needed:

pandas, biopython, python2.7 

import pandas,  numpy,  Bio,  re  



# local PC version


# Instructions:

1. the 'SNPs_with_crystal_structure' contains all proteins need to be processed

2. 'pdb_only/ENSPxxxxxxxxxx.out' contains a list of crystal structures that was created by doing blast for the ensembl sequence agains the fasta sequences of the crystal structures that has a similarity more than 0.8, which will be compared against ENSPxxxxxxxxxx.seq which can be found in '/Ensembl/'  which is the ensembl sequences of proteins where we know exactly the position of the Single Nucleotide Polymorphism (SNP).

3. The crystal structures sequences are located in 'fasta/'  

4. run file : multi_mapping.py    


# HPC version

hpc/ folder contains gnuparallel method processing on SupreMike

split SNPs_with_crystal_structure into several part(every little part has titile), feed them to cores coorespondently. 

1. load module python, gcc, gnuparallel all you needed in ~/.modules

    ~/.modules : module load python/2.7.14-anaconda
                 module load gnuparallel/20180222/INTEL-18.0.0
                 
    $ conda create -n your_env python=2.7
    
    $ source activate your_env
    
    $ conda install pandas
    
    $ conda install biopython
   
   
   ***** all the path needed in scripts should be changed to our own path ******
   
2. 'python gen_input_lst.py -numLst N' sepreate SNPs_with_crystal_structure into N parts  

    (N % 16 ==0, hpc each node has 16 cores )  
    
    and generate 'input.lst' which will be fed to 'pbs.script' 
    
3. 'qsub pbs.script' to hpc, the number of nodes applied should be N/16. 

   (eg. N=16 ~ 1node, N=48 ~ 3nodes, N=128 ~ 8nodes)  
  
4. 'python combine_folder.py' can combine N part into one file.
  
