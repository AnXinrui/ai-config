#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-$HOME/.cursor/rules}"

mkdir -p "$TARGET"
cp "$SCRIPT_DIR"/cursor-rules/*.mdc "$TARGET"/
echo "已同步 $(ls "$SCRIPT_DIR"/cursor-rules/*.mdc | wc -l | tr -d ' ') 个规则到 $TARGET"
