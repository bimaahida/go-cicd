FROM golang:1.18.0-alpine AS builder
RUN go version

ADD . /app
WORKDIR /go/src/app

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o echo-cicd .

FROM alpine
WORKDIR /app
COPY --from=builder /app/echo-cicd /usr/bin/

ENTRYPOINT ["echo-cicd", "server"]