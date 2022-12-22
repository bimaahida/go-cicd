FROM golang:1.18.0-alpine AS builder

RUN apk add git

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o echo-cicd .

FROM scratch

WORKDIR /app

COPY --from=builder /app/echo-cicd /usr/bin/

ENTRYPOINT ["echo-cicd", "server"]

