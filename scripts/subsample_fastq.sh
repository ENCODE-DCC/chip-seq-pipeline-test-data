#!/bin/bash

RATIO=0.04
RATIO_REP2=0.05
# SE
cd /mnt/data/pipeline_test_samples/encode-chip-seq-pipeline/ENCSR000DYI/fastq
seqtk sample -s100 rep1.fastq.gz ${RATIO} | gzip -nc > rep1.subsampled.25.fastq.gz
seqtk sample -s100 rep2.fastq.gz ${RATIO_REP2} | gzip -nc > rep2.subsampled.20.fastq.gz
seqtk sample -s100 ctl1.fastq.gz ${RATIO} | gzip -nc > ctl1.subsampled.25.fastq.gz
seqtk sample -s100 ctl2.fastq.gz ${RATIO} | gzip -nc > ctl2.subsampled.25.fastq.gz
#gsutil cp *.subsampled.25.fastq.gz gs://encode-pipeline-test-samples/encode-chip-seq-pipeline/ENCSR000DYI/fastq_subsampled

RATIO=0.015
RATIO_CTL=0.0125

# PE
cd /mnt/data/pipeline_test_samples/encode-chip-seq-pipeline/ENCSR936XTK/fastq
seqtk sample -s100 rep1-R1.fastq.gz ${RATIO} | gzip -nc > rep1-R1.subsampled.67.fastq.gz
seqtk sample -s100 rep1-R2.fastq.gz ${RATIO} | gzip -nc > rep1-R2.subsampled.67.fastq.gz
seqtk sample -s100 rep2-R1.fastq.gz ${RATIO} | gzip -nc > rep2-R1.subsampled.67.fastq.gz
seqtk sample -s100 rep2-R2.fastq.gz ${RATIO} | gzip -nc > rep2-R2.subsampled.67.fastq.gz
seqtk sample -s100 ctl1-R1.fastq.gz ${RATIO_CTL} | gzip -nc > ctl1-R1.subsampled.80.fastq.gz
seqtk sample -s100 ctl1-R2.fastq.gz ${RATIO_CTL} | gzip -nc > ctl1-R2.subsampled.80.fastq.gz
seqtk sample -s100 ctl2-R1.fastq.gz ${RATIO_CTL} | gzip -nc > ctl2-R1.subsampled.80.fastq.gz
seqtk sample -s100 ctl2-R2.fastq.gz ${RATIO_CTL} | gzip -nc > ctl2-R2.subsampled.80.fastq.gz
#gsutil cp *.subsampled.100.fastq.gz gs://encode-pipeline-test-samples/encode-chip-seq-pipeline/ENCSR936XTK/fastq_subsampled
