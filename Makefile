-include /opt/basics/common/common.mk

export PATH := $(CURDIR)/bin:$(PATH)

compose-setup: compose-build

compose:
	docker-compose up

compose-build:
	docker-compose build

code-lint:
	luacheck modules lib

local-test:
	@for lesson in modules/*/*/Makefile; do \
		$(MAKE) --no-print-directory -C "$${lesson%/Makefile}" test || exit 1; \
	done

compose-bash:
	docker-compose run --rm exercises bash

compose-test:
	docker-compose run --rm exercises make test

compose-code-lint:
	docker-compose run --rm exercises make code-lint

compose-description-lint:
	docker-compose run --rm exercises make description-lint

compose-schema-validate:
	docker-compose run --rm exercises make schema-validate

compose-down:
	docker-compose down -v --remove-orphans

ci-check:
	docker-compose -f docker-compose.yml down -v --remove-orphans
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit

.PHONY: local-test code-lint compose-description-lint compose-schema-validate
