#!/bin/bash
set -euo pipefail

HELM_DOCS_VERSION="1.11.0"
ARCHICTURE="Linux_x86_64"

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"${HELM_DOCS_VERSION}"/helm-docs_"${HELM_DOCS_VERSION}"_${ARCHITECTURE}.tar.gz
tar -xf /tmp/helm-docs.tar.gz helm-docs

# validate docs
./helm-docs
git diff --exit-code