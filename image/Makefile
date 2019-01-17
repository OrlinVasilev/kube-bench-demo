build:
	docker build . -t orlix/docker:latest

push: build
	docker push orlix/docker:latest

run: build
	docker run -ti --rm orlix/docker:latest

push: build
	docker push orlix/docker:latest
