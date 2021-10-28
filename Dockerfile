FROM golang:1.16-alpine AS builder

RUN go version

COPY . /myWebSite/
WORKDIR /myWebSite/

RUN go mod download
RUN GOOS=linux go build -o ./.bin/site main.go

#lightweight docker container with binary
FROM alpine:latest

WORKDIR /root/

COPY --from=0 /myWebSite/.bin ./.bin
COPY --from=0 /myWebSite/assets ./assets
COPY --from=0 /myWebSite/index.html .

EXPOSE 3000

CMD ["./.bin/site"]