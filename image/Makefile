TAG = latest
build:
	docker build . -t orlix/docker:$(TAG)

push: build
	docker push orlix/docker:$(TAG)

run: build
	docker run -ti --rm orlix/docker:$(TAG)