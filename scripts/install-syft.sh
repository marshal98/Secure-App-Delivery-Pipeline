#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/versions.sh"

echo "Installing Syft ${SYFT_VERSION}..."

curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | \
sh -s -- -b /usr/local/bin "v${SYFT_VERSION}"

echo
echo "Installed Version:"
syft version