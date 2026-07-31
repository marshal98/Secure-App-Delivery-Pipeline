#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Gitleaks ${GITLEAKS_VERSION}..."

WORKDIR=$(mktemp -d)
cd "$WORKDIR"

curl -fL -o gitleaks.tar.gz \
  "https://github.com/gitleaks/gitleaks/releases/download/v${GITLEAKS_VERSION}/gitleaks_${GITLEAKS_VERSION}_linux_x64.tar.gz"

tar -xzf gitleaks.tar.gz

sudo install -m 755 gitleaks /usr/local/bin/gitleaks

echo
echo "Installed Version:"
gitleaks version