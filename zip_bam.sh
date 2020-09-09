#!/bin/bash

find /u/scratch/d/danjst1/https:/api.gdc.cancer.gov/data/c2ec8926-de77-4c56-aaeb-d39f6a0cbc00 -name '*.bam' -exec samtools bam2fq '{}' > SAMPLE.fastq \;


find /u/scratch/d/danjst1/https:/api.gdc.cancer.gov/data/c2ec8926-de77-4c56-aaeb-d39f6a0cbc00 -name 'SAMPLE.fastq' -exec cat {} \; | grep '^@.*/1$' -A 3 --no-group-separator > SAMPLE_r1.fastq

find /u/scratch/d/danjst1/https:/api.gdc.cancer.gov/data/c2ec8926-de77-4c56-aaeb-d39f6a0cbc00 -name 'SAMPLE.fastq' -exec cat {} \; | grep '^@.*/2$' -A 3 --no-group-separator > SAMPLE_r2.fastq


find /u/scratch/d/danjst1/https:/api.gdc.cancer.gov/data/ -name 'SAMPLE*' -exec rm {} \;


find $(pwd) -name 'IRFinder-IR-nondir.txt' -exec cp {} /u/scratch/d/danjst1/IRFinder-1.2.5/ir1_results \;

rm ./!(IRFinder-IR-nondir.txt)

find . -type f \! -name "IRFinder-IR-nondir.txt" -exec rm {} \;
