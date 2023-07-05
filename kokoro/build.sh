#!/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x

PROJECT_ID="muskan-dlp-test-local3"
DATASET_ID="gh_test_2"
GCS_BUCKET="muskan-dlp-test-local3-demo-data"
TABLE_ID_1="CCRecords_1564602825"
TABLE_ID_2="CCRecords_1564602826"
TABLE_ID_3="CCRecords_1564602828"
TABLE_ID_4="CCRecords_1564602829"
TABLE_ID_5="CCRecords_1564602830"
INSPECT_TEMPLATE_PATH="projects/muskan-dlp-test-local3/locations/global/inspectTemplates/dlp-demo-inspect-latest-1680688062701"
DEID_TEMPLATE_PATH="projects/muskan-dlp-test-local3/locations/global/deidentifyTemplates/dlp-demo-deid-latest-1680688062701"


echo $PROJECT_ID

echo "Starting DLP DEID pipeline ..."

gradle run -DmainClass=com.google.swarm.tokenization.DLPTextToBigQueryStreamingV2 -Pargs=" \
  --region=us-central1 \
  --project=${{env.PROJECT_ID}} \
  --streaming \
  --enableStreamingEngine \
  --tempLocation=gs://${{env.GCS_BUCKET}}/temp \
  --numWorkers=2 \
  --maxNumWorkers=3 \
  --runner=DataflowRunner \
  --filePattern=gs://${{env.GCS_BUCKET}}/*.csv \
  --dataset=${{env.DATASET_ID}} \
  --inspectTemplateName=${{env.INSPECT_TEMPLATE_PATH}} \
  --deidentifyTemplateName=${{env.DEID_TEMPLATE_PATH}} \
  --batchSize=200000 \
  --DLPMethod=DEID"

echo "Finished starting DLP DEID pipeline!"