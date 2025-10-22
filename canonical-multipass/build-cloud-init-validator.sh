#! /usr/bin/env bash

DOCKERFILE_PATH="./cloud-init-validator.dockerfile"

DOCKER_IMAGE="cloud-init-validator"
DOCKER_IMAGE_TAG="latest"

docker build \
	--load \
	--progress=plain \
	--tag "${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG}" \
	--file "${DOCKERFILE_PATH}" \
	./
