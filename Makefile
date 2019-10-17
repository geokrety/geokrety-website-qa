SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PTY_PREFIX=
ifeq (Windows_NT, ${OS})
	PTY_PREFIX=winpty
endif

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

test: ## run robot framework tests (master env)
	@echo "Run Tests"
	./scripts/runTests.sh
testlocal: ## run robot framework tests (local env)
	@echo "Run Tests"
	./scripts/runTests.sh local
testv2: ## run robot framework tests (feature/new-theme env)
	@echo "Run Tests"
	./scripts/runTests.sh feature/new-theme
testv2bs: ## run robot framework browserstack tests (feature/new-theme env)
	@echo "Run BrowserStack tests with username:${BS_USERNAME} (and BS_TOKEN must be set)"
	BS_ENABLED=1 ./scripts/runTests.sh feature/new-theme