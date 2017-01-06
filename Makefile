DOCKER_IMAGE_TAG ?= alpine
DOCKER_IMAGE_NAME ?= postgres
DOCKER_CONTAINER_NAME ?= postgres_1

default: help

help:
	@echo "Usage: 'make <target>' where <target> is one of"
	@echo "  pull            pull docker image"
	@echo "  run             run the docker image"
	@echo "  bash            starts bash inside the running container"
	@echo "  stop            stops the container"
	@echo "  rm              removes the container and wipes image on disk"
	@echo "  pgc             starts postgres client container and connect"

run:
	@echo "Running docker image..."
	docker run --name $(DOCKER_CONTAINER_NAME) \
	-v $(PWD)/initdb.d:/docker-entrypoint-initdb.d:ro \
	--env-file postgres.env \
	-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) -p 5432:5432 -d "$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)"

bash:
	@echo "Starting bash..."
	docker exec -it $(DOCKER_CONTAINER_NAME) /bin/bash

stop:
	@echo "Stop container..."
	docker stop $(DOCKER_CONTAINER_NAME)

rm:
	@echo "Remove container..."
	docker rm -f $(DOCKER_CONTAINER_NAME)

pull:
	@echo "Pulling images..."
	docker pull "$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)"
