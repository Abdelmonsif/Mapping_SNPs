#!/bin/bash
export PYTHONPATH=/home/$USER/.conda/envs/my_env/lib/python2.7/site-packages:$PYTHONPATH
cd /work/$USER/Mapping_SNPs-master/hpc/
python mapping_serial.py -inputCSV $1 -out output/$2.out 2>&1
