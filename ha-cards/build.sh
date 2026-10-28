#!/usr/bin/env bash
# Rebuild omada-network-card.js from upstream RCooLeR/omada_exporter with our patches applied.
# Usage: ./build.sh [upstream-tag]   → dist/omada-network-card.js
set -euo pipefail
TAG="${1:-v2.4.4}"
HERE="$(cd "$(dirname "$0")" && pwd)"
WORK="$(mktemp -d)"
git clone -q --depth 1 --branch "$TAG" https://github.com/RCooLeR/omada_exporter "$WORK/up"
cd "$WORK/up/ha-cards"
for p in "$HERE"/*.patch; do patch -p1 < "$p"; done
npm ci --no-audit --no-fund
npm run build
mkdir -p "$HERE/dist" && cp dist/omada-network-card.js "$HERE/dist/"
echo "built $HERE/dist/omada-network-card.js ($(wc -c < "$HERE/dist/omada-network-card.js") bytes)"
