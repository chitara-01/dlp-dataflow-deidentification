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
