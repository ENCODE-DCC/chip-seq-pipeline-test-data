# chip-seq-pipeline-test-data
Test data for ENCODE chip-seq-pipeline2

Single ended dataset (ENCSR000DYI) and corrsponding control set (ENCSR496AXR) is subsampled down to 1/25 (1/20 for rep2 only) reads.
Paired end dataset (ENCSR936XTK) is subsampled down to 1/67 reads and corresponding control set (ENCSR398JTO) is subsampled down to 1/80 reads.

Genome data on `/genome_data` are based on two chromosomes (chr19 and chrM) only.


# How to extract chr19 and chrM from original fasta

```
$ cd scripts
$ ./subsample_ref_fasta.sh
```

# How to generate reference outputs

0) Make sure that you have an executable `cromwell-30.1.jar` in your `PATH`.

1) Specify correct file paths in `subsample_fastq.sh` and run to subsample test samples.
```
$ cd test_sample
$ ./subsample_fastq.sh
```

2) Generate base reference outputs by running the following shell scripts. These test samples are subsampled down to 1/200 reads.
```
$ cd scripts
$ ./ENCSR000DYI.sh
$ ./ENCSR936XTK.sh
```

3) Wait until 2) is done. Link outputs of 2) to JSON files in `test_sample/*.sh`, run other shell scripts.
```
$ cd scripts
$ ./ENCSR000DYI_bam2ta_subsample.sh
$ ./ENCSR000DYI_no_dup_removal.sh
$ ./ENCSR000DYI_xcor_subsample.sh
$ ./ENCSR936XTK_bam2ta_subsample.sh
$ ./ENCSR936XTK_no_dup_removal.sh
$ ./ENCSR936XTK_xcor_from_ta.sh
$ ./ENCSR936XTK_xcor_subsample.sh
```