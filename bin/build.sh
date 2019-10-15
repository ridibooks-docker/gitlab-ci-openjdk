#!/usr/bin/env bash

set -e

source .env

DOCKER_TAG=${1}

function print_usage
{
    echo
    echo "Usage: build.sh <DOCKER_TAG>"
    echo
    echo "Example:"
    echo "  build.sh latest"
}

if [[ -z "${DOCKER_TAG}" ]]
then
    echo "No DOCKER_TAG specified."
    print_usage
    exit 1
fi

echo "=> Building start with args"
echo "CONTAINER_ARCHITECTURE=${CONTAINER_ARCHITECTURE}"
echo "AWS_CLI_VERSION=${AWS_CLI_VERSION}"
echo "ECS_CLI_VERSION=${ECS_CLI_VERSION}"
echo "DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}"

echo "Build a image - gitlab-ci-openjdk:${DOCKER_TAG}"
docker build --pull \
  --build-arg "CONTAINER_ARCHITECTURE=${CONTAINER_ARCHITECTURE}" \
  --build-arg "AWS_CLI_VERSION=${AWS_CLI_VERSION}" \
  --build-arg "ECS_CLI_VERSION=${ECS_CLI_VERSION}" \
  --build-arg "DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}" \
  -t "gitlab-ci-openjdk:${DOCKER_TAG}" .
