-include /opt/basics/common/common.mk

compose-setup: compose-build

compose:
	docker-compose up

compose-build:
	docker-compose build

code-lint:
	luacheck modules

compose-bash:
	docker-compose run --rm exercises bash

compose-test:
	docker-compose run --rm exercises make test

compose-code-lint:
	docker-compose run --rm exercises make code-lint

compose-down:
	docker-compose down -v --remove-orphans

ci-check:
	docker-compose -f docker-compose.yml down -v --remove-orphanss
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit
