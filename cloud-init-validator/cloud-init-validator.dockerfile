# syntax=docker/dockerfile:1

FROM ubuntu:25.10 AS UBUNTU_BASE

RUN apt-get update \
	&& apt-get install -y cloud-init

RUN mkdir -p ${HOME}/test_configs

ENTRYPOINT ["cloud-init", "schema", "--annotate", "-c"]
CMD ["example-cloud-init.yml"]
