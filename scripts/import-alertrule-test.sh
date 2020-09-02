#!/bin/bash
set -euo pipefail

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

mkdir -p ${PROJECT_ROOT}/${TEST_FOLDER} && yq w ${SUBSTRATE_RULES_FOLDER}/alerting-rule-tests.yaml "tests[*].alert_rule_test[*].exp_alerts[*].exp_labels.origin" testnet-0 | sed 's/{}//g' - > ${PROJECT_ROOT}/${TEST_FOLDER}/${TEST_FILE_NAME}