#!/usr/bin/env bash
set -Eeuo pipefail

# Compatibility entry point; the root installer installs the shared Nerd Font.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/../install.sh" "$@"
