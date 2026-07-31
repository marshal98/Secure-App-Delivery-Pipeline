#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Checkov ${CHECKOV_VERSION}..."

python3 -m pip install --upgrade pip

pip3 install checkov=="${CHECKOV_VERSION}"

echo
echo "Installed Version:"
checkov --version