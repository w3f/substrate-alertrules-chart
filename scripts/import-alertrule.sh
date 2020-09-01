#!/bin/bash
set -euo pipefail

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

import_alertrule() {
  cat ${CURRENT_DIR}/template/prefix.yaml > ${RULE_FILE_NAME}
  yq p ${SUBSTRATE_RULES_FOLDER}/alerting-rules.yaml spec | sed 's/{{ $labels.instance }}/{{`{{ $labels.instance }}`}}/g' - | sed 's/{{ $value }}/{{`{{ $value }}`}}/g' - | yq w - "spec.groups[*].rules[*].labels.origin" "{{ .Values.deploymentName }}" | sed "s/'{{ .Values.deploymentName }}'/{{ .Values.deploymentName }}/g" - >> ${RULE_FILE_NAME}
  cat ${CURRENT_DIR}/template/postfix.yaml >> ${RULE_FILE_NAME}
  mkdir -p ${PROJECT_ROOT}/${CHART_FOLDER} && mv ${RULE_FILE_NAME} ${PROJECT_ROOT}/${CHART_FOLDER}
}

print_imported() {
  echo "imported new ${RULE_FILE_NAME}"
  echo "##########################################"
  cat ${PROJECT_ROOT}/${CHART_FOLDER}/${RULE_FILE_NAME}
  echo
  echo "##########################################"
}

main() {
  import_alertrule
  print_imported
}

main


