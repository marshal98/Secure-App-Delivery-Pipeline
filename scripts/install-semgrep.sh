#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Semgrep ${SEMGREP_VERSION}..."

python3 -m pip install --upgrade pip

pip3 install semgrep=="${SEMGREP_VERSION}"

echo
echo "Installed Version:"
semgrep --version