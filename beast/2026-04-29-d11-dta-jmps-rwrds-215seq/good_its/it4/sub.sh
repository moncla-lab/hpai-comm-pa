#!/bin/bash
#BSUB -W 96:00 # walltime of 4 days
#BSUB -J 2026-04-30_d11_dta_215 # job name
#BSUB -o 2026-04-30_d11_dta_215.out
#BSUB -e 2026-04-30_d11_dta_215.err
#BSUB -M 20240
#BSUB -N
#BSUB -u asjaeger@upenn.edu    # sends email upon job completion

module load openjdk-1.8.0
module load beast/1.10.4
module load beagle/4.0.0
module load gcc/8.5.0 

beast -beagle -beagle_SSE 4-29-215seq-dta-d11.xml
