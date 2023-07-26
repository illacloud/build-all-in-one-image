.PHONY: build all run-test run-non-root-test rm-test

all: build 

build:
	docker build ./ -f ./Dockerfile -t illa-builder:local

run-test:
	docker run -d -p 80:2022 --name illa_builder_local -v ~/illa-database:/opt/illa/database -v ~/illa-drive:/opt/illa/drive illa-builder:local

run-non-root-test:
	docker run -d -p 80:2022 --name illa_builder_local --user 1002:1002 -v ~/illa-database:/opt/illa/database -v ~/illa-drive:/opt/illa/drive illa-builder:local

rm-test:
	docker stop illa_builder_local; docker rm illa_builder_local;

 	
