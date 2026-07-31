#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Trivy ${TRIVY_VERSION}..."

WORKDIR=$(mktemp -d)
cd "$WORKDIR"

curl -fL -o trivy.tar.gz \
  "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz"

tar -xzf trivy.tar.gz

sudo install -m 755 trivy /usr/local/bin/trivy

echo
echo "Installed Version:"
trivy --version