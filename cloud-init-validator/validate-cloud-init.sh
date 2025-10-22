#! /usr/bin/env bash

# Helper Script to Run the `cloud-init` Validation on a given Config File
#
# This relies on a Docker Image shared publicly to Docker Hub, in which the developer
# did a minimal setup with `cloud-init` and is using the validation functionality when
# volume-mounting the config file to a specific path in the running Docker Container.
#
# This is especially helpful on macOS or Windows systems where an installation of
# `cloud-init` is not available due to the lack of `systemd` and other Linx-specific
# dependencies.
#
# This script does require that you have `docker` setup on your system and that you have
# public-facing access to Docker Hub, in order to pull the third-party image.
#
# This script takes a single argument without any flags and then that file will be
# volume-bind mounted to the running Docker Container, the output will be shown
# through `stdout` and `stderr`, and then the Docker Container will be destroyed. The
# Docker Image will remain on your system until you prune your Docker Images and remove
# it, but if you're going to want to repeatedly validate `cloud-init` files, you likely
# should leave the image so that you have it available.
#
# References:
#   - https://formulae.brew.sh/formula/docker
#   - https://hub.docker.com/r/lionelnicolas/tiny-cloud-init

set -eu

cloud_init_config_path=$1
# cloud_init_env_path=${2:-""}

DOCKER_IMAGE="cloud-init-validator"
DOCKER_IMAGE_TAG="latest"

DOCKER_CONTAINER_NAME="cloud_init_validate"
DOCKER_BIND_TARGET="/root/test_configs"

if [[ "${cloud_init_config_path}" == "DEBUG" ]]; then
    docker run \
        -it \
        --rm \
        --name "${DOCKER_CONTAINER_NAME}" \
        --mount type=bind,src="$(PWD)",dst="${DOCKER_BIND_TARGET}",readonly \
        --entrypoint "/bin/bash" \
        "${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG}"
else
    config_mount_dir=$(dirname "${cloud_init_config_path}")
    cloud_init_config_name=$(basename -- "${cloud_init_config_path}")

    docker run \
        -it \
        --rm \
        --name "${DOCKER_CONTAINER_NAME}" \
        --log-driver="json-file" \
        --volume ${config_mount_dir}:"${DOCKER_BIND_TARGET}":ro \
        "${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG}" \
        "${DOCKER_BIND_TARGET}/${cloud_init_config_name}"
fi
