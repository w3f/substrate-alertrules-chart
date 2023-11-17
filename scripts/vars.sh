#!/bin/bash
set -euo pipefail

SUBSTRATE_VER=monthly-2022-03
PROJECT_ROOT=`git rev-parse --show-toplevel`
TEST_FOLDER_PROMETHEUS="tests/prometheus"
TEST_FOLDER="${TEST_FOLDER_PROMETHEUS}/substrate-alertrules"
CHART_FOLDER="charts/substrate-alertrules/templates"
RULE_FILE_NAME="alertrules.yaml"
TEST_FILE_NAME="alertrules.yaml"
SUBSTRATE_FOLDER="/tmp/substrate"
SUBSTRATE_RULES_FOLDER=${SUBSTRATE_FOLDER}/scripts/ci/monitoring/alerting-rules
