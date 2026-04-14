#!/usr/bin/env bash

set -euo pipefail

echo "Starting CI checks..."

if [[ -f package.json ]]; then
  echo "Node project detected."
  if [[ -f package-lock.json ]]; then
    npm ci
  else
    npm install
  fi
  npm run lint --if-present
  npm test --if-present
else
  echo "No package.json found. Skipping Node checks."
fi

if [[ -f requirements.txt || -f pyproject.toml ]]; then
  echo "Python project detected."
  python -m pip install --upgrade pip
  if [[ -f requirements.txt ]]; then
    pip install -r requirements.txt
  fi
  if [[ -f pyproject.toml ]]; then
    pip install .
  fi
  if command -v pytest >/dev/null 2>&1; then
    pytest -q
  else
    echo "pytest not installed. Skipping Python tests."
  fi
else
  echo "No Python dependency file found. Skipping Python checks."
fi

echo "CI checks completed."
