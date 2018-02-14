#!/bin/bash

CROMWELL_JAR=$(which cromwell-30.1.jar)
WDL=$CODE/chip-seq-pipeline-dev/chipseq.wdl
INPUT=$CODE/chip-seq-pipeline-test-data/scripts/ENCSR000DYI_xcor_subsample.json
WF_OPT=$CODE/chip-seq-pipeline-dev/workflow_opts/docker.json
BACKEND_CONF=$CODE/chip-seq-pipeline-dev/backends/backend.conf
BACKEND=Local

mkdir -p ENCSR000DYI_xcor_subsample && cd ENCSR000DYI_xcor_subsample
java -Dconfig.file=${BACKEND_CONF} -Dbackend.default=${BACKEND} -jar ${CROMWELL_JAR} run ${WDL} -i ${INPUT} -o ${WF_OPT}
find $PWD -name '*.bam' | grep -v glob | grep shard-0
find $PWD -name '*.flagstat.qc' | grep -v glob | grep shard-0
find $PWD -name '*.tagAlign.gz' | grep -v glob | grep shard-0
find $PWD -name '*.tagAlign.gz' | grep -v glob | grep pr1
find $PWD -name '*.tagAlign.gz' | grep -v glob | grep pool_ta
find $PWD -name '*.cc.qc' | grep -v glob | grep shard-0
find $PWD -name '*.frip.qc' | grep -v glob | grep shard-0
find $PWD -name '*.narrowPeak.gz' | grep -v glob | grep shard-0
find $PWD -name '*reproducibility.qc' | grep -v glob
cd ..
