#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_PYTHON="$ROOT_DIR/.venv/bin/python"
MANAGE_PY="$ROOT_DIR/Learningplatform/manage.py"

if [[ ! -x "$VENV_PYTHON" ]]; then
  echo "Missing virtual environment at $ROOT_DIR/.venv"
  echo "Create it with: python3 -m venv .venv"
  exit 1
fi

exec "$VENV_PYTHON" "$MANAGE_PY" runserver "${1:-127.0.0.1:8000}"
