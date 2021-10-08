.PHONY:

build:
	go build -o ./.bin/site main.go

run: build
	./.bin/site

clear:
	rm -rf ./.bin

build-image:
	docker build -t web-site:v0.1 .

start-container:
	docker run --env-file .env -p 3000:3000 web-site:v0.1