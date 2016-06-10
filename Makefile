VERSION=2.12

PROJECT_NAME:=gradle
IMAGE_NAME:=ericzumba/$(PROJECT_NAME):$(VERSION)

.PHONY:image
image:
	@if ! docker images $(IMAGE_NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo 'building image'; docker build --build-arg GRADLE_VERSION=$(VERSION) -t $(IMAGE_NAME) . ; fi

.PHONY:push
push:image
	docker push $(IMAGE_NAME)
