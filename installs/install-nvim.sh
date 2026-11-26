#!/usr/bin/env bash
set -Eeuo pipefail

# Compatibility entry point; setup is maintained in the root installer.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/../install.sh" "$@"
