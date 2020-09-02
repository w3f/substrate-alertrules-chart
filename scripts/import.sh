#!/bin/bash
set -euo pipefail

CURRENT_DIR=$(dirname "$0")

${CURRENT_DIR}/import-substrate.sh
${CURRENT_DIR}/import-alertrule.sh
${CURRENT_DIR}/import-alertrule-test.sh

#rm -rf ${SUBSTRATE_FOLDER}