#!/bin/bash

echo "[Ø] Exporting globally installed NPM packages..."
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > installed.txt
echo "[Ø] Done."
exit 0
