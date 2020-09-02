#!/bin/bash
set -euo pipefail
set -x

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

for file in $(find "${TEST_FOLDER_PROMETHEUS}" -name *yaml | sed 's|^'"${TEST_FOLDER_PROMETHEUS}"/'||'); do
    chart_name=${file%%/*}
    template_name=${file##*/}

    helm template --set monitoring=true -s "templates/${template_name}" "charts/${chart_name}" | yq r - spec | promtool check rules /dev/stdin
    helm template --set monitoring=true -s "templates/${template_name}" "charts/${chart_name}" | yq r - spec | promtool test rules "${TEST_FOLDER_PROMETHEUS}/${chart_name}/${template_name}"
done
