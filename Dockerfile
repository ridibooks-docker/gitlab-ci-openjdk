FROM openjdk:11

ARG CONTAINER_ARCHITECTURE=linux-amd64
ARG AWS_CLI_VERSION
ARG ECS_CLI_VERSION
ARG DOCKER_COMPOSE_VERSION

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        python3 \
        python3-pip \
    && pip3 install --upgrade \
        awscli==${AWS_CLI_VERSION} \
        docker-compose==${DOCKER_COMPOSE_VERSION} \
    && curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-${CONTAINER_ARCHITECTURE}-v${ECS_CLI_VERSION} \
    && chmod +x /usr/local/bin/ecs-cli \
    && rm -rf /var/lib/apt/lists/*
