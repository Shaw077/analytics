SHELL := /bin/bash

.PHONY: help setup lint test format ci

help:
	@echo "Available targets:"
	@echo "  setup   - install project dependencies"
	@echo "  lint    - run linters if configured"
	@echo "  test    - run tests if configured"
	@echo "  format  - run code formatters if configured"
	@echo "  ci      - run local CI checks"

setup:
	@if [ -f package.json ]; then npm install; fi
	@if [ -f requirements.txt ]; then python -m pip install -r requirements.txt; fi

lint:
	@if [ -f package.json ]; then npm run lint --if-present; fi
	@if [ -f pyproject.toml ]; then python -m pip install ruff && ruff check .; fi

test:
	@if [ -f package.json ]; then npm test --if-present; fi
	@if [ -d tests ]; then python -m pytest -q; fi

format:
	@if [ -f package.json ]; then npm run format --if-present; fi
	@if [ -f pyproject.toml ]; then python -m pip install black && black .; fi

ci:
	@bash .github/scripts/ci.sh
