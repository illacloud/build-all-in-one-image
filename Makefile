.PHONY: build all test clean

all: build 

build:
	docker build ./ -f ./dockerfile -t illa-builder:local-build

run:
	docker run -d -p 80:80 --name  illa-builder illa-builder:local-build

clean:
	docker stop illa-builder; docker rm illa-builder; docker rmi illa-builder:local-build
