IMAGE_NAME := runner-scale-set-image

default: build-image send-image-kind

build-image: ## Build the docker image
	docker build -t $(IMAGE_NAME) .

send-image-kind: ## Send the image to the kind cluster
	kind load docker-image $(IMAGE_NAME) --name arc