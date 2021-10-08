FROM golang:1.16-alpine AS builder

RUN go version

COPY . /myWebSite/
WORKDIR /myWebSite/

RUN go mod download
RUN GOOS=linux go build -o ./.bin/site main.go

EXPOSE 3000

CMD ["./.bin/site"]