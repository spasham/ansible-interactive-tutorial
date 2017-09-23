USER=turkenh
TAG=latest

.DEFAULT_GOAL := all

build:
	docker build -t $(USER)/${IMAGE}:${TAG} -f images/${IMAGE}/Dockerfile .

push:
	docker push $(USER)/${IMAGE}:${TAG} 

build_and_push: build push

build_all:
	IMAGE=ubuntu-1404-ansible-docker-host $(MAKE) build
	IMAGE=ubuntu-1604-ansible-docker-host $(MAKE) build
	IMAGE=ansible-tutorial $(MAKE) build

push_all:
	IMAGE=ubuntu-1404-ansible-docker-host $(MAKE) push
	IMAGE=ubuntu-1604-ansible-docker-host $(MAKE) push
	IMAGE=ansible-tutorial $(MAKE) push

all: build_all push_all
