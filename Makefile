.PHONY: build all test clean

all: build 

build-test:
	docker build ./ -f ./Dockerfile -t illa-builder:refactor

run-test:
	docker run -d -p 8000:80 --name refactor -v /home/testing/illa-data:/opt/illa/database -v /home/testing/illa-drive:/opt/illa/drive illasoft/illa-builder:refactor

run-non-root-test:
	docker run -d -p 8000:80 --name refactor --user 1002:1002 -v /home/testing/illa-data:/opt/illa/database -v /home/testing/illa-drive:/opt/illa/drive illasoft/illa-builder:refactor

rm-test:
	docker stop refactor; docker rm refactor;

 	
