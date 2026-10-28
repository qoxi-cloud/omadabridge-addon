#!/usr/bin/env bash
# Rebuild omada-network-card.js from upstream RCooLeR/omada_exporter with our patches applied.
# Usage: ./build.sh [upstream-tag]   → dist/omada-network-card.js
set -euo pipefail
TAG="${1:-v2.4.4}"
HERE="$(cd "$(dirname "$0")" && pwd)"
WORK="$(mktemp -d)"
git clone -q --depth 1 --branch "$TAG" https://github.com/RCooLeR/omada_exporter "$WORK/up"
cd "$WORK/up/ha-cards"
# patches are generated with `git diff -- ha-cards/src` in an upstream clone (paths a/ha-cards/src/...)
for p in "$HERE"/*.patch; do git apply --directory=ha-cards --unsafe-paths "$p" 2>/dev/null || (cd .. && git apply "$p"); done
npm ci --no-audit --no-fund
npm run build
mkdir -p "$HERE/dist" && cp dist/omada-network-card.js "$HERE/dist/"
echo "built $HERE/dist/omada-network-card.js ($(wc -c < "$HERE/dist/omada-network-card.js") bytes)"
