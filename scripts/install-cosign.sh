#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Cosign ${COSIGN_VERSION}..."

curl -O -L "https://github.com/sigstore/cosign/releases/download/v${COSIGN_VERSION}/cosign-linux-amd64"

chmod +x cosign-linux-amd64

sudo mv cosign-linux-amd64 /usr/local/bin/cosign

echo
echo "Installed Version:"
cosign version