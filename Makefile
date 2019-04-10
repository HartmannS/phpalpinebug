###############################################################################
## Makefile - alpinebug                                                     ##
###############################################################################
PHP_BIN=php

GREEN=\033[0;32m
NOCOLOR=\033[0m

.PHONY: list
list:
	@echo
	cat Makefile | grep '^[a-z0-9_-]\+:' | sed 's/:.*//' | sed 's/^/  • make /' | sort
	@echo

.PHONY: help
help:
	@make list

###############################################################################
##                                                                           ##
###############################################################################

.PHONY: build
build:
	docker build -f 'Dockerfile.alpine' --tag alpine:bug .
	docker build -f 'Dockerfile.stretch' --tag stretch:bug .

.PHONY: run
run:
	docker run alpine:bug php minimalExample.php
	docker run stretch:bug php minimalExample.php