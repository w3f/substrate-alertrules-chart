#!/bin/bash
set -euo pipefail

CURRENT_DIR=$(dirname "$0")
source ${CURRENT_DIR}/vars.sh

[[ -d ${SUBSTRATE_FOLDER} ]] || git clone -b ${SUBSTRATE_VER} https://github.com/paritytech/substrate.git ${SUBSTRATE_FOLDER}
