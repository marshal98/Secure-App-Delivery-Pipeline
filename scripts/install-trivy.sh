#!/usr/bin/env bash

set -euo pipefail

TRIVY_VERSION="0.65.0"

echo "Installing Trivy ${TRIVY_VERSION}..."

WORKDIR=$(mktemp -d)
cd "$WORKDIR"

DOWNLOAD_URL="https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz"

echo "Downloading from:"
echo "$DOWNLOAD_URL"

curl -fL -o trivy.tar.gz "$DOWNLOAD_URL"

tar -xzf trivy.tar.gz

sudo install -m 755 trivy /usr/local/bin/trivy

echo
echo "Installed version:"
trivy --version