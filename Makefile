SHELL = /bin/sh

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

export CURRENT_UID
export CURRENT_GID

.PHONY: init
init:
	./mkdir development
	docker-compose run -it dev mysql_secure_installation
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
	docker-compose run -it dev /bin/bash


# bench get-app https://github.com/frappe/wiki