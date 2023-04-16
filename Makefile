SHELL = /bin/sh

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

export CURRENT_UID
export CURRENT_GID

.PHONY: up
up:
	docker-compose up -d --force-recreate --build --remove-orphans

.PHONY: down
down:
	docker-compose down

.PHONY: logs
logs:
	docker-compose logs -f

.PHONY: sh
sh:
	docker-compose exec -it frappe /bin/bash

.PHONY: start
start:
	docker-compose exec -it frappe sh -c "cd frappe-bench && bench start"
