.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: .cache/venv .cache/ansible ## Create local environment

.PHONY: clean
clean: ## Remove cache
	rm -rf .cache *.tar.gz

.PHONY: build
build: ## Build collection archive
	ansible-lint
	ansible-galaxy collection build --force

.cache/venv:
	python3 -m venv .cache/venv
	.cache/venv/bin/python3 -m pip install -U pip setuptools wheel
	.cache/venv/bin/python3 -m pip install \
		ansible-lint==6.10.2 \
		ansible==7.1.0

.cache/ansible:
	mkdir -p .cache/ansible
