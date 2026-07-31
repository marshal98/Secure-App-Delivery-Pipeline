#!/usr/bin/env bash

set -euo pipefail

TRIVY_VERSION="0.65.0"

echo "Installing Trivy ${TRIVY_VERSION}..."

mkdir -p /tmp/trivy
cd /tmp/trivy

curl -sSL -o trivy.tar.gz \
  "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz"

tar -xzf trivy.tar.gz

sudo install trivy /usr/local/bin/trivy

echo "Installed Trivy Version:"
trivy --version