FROM golang:1.18.0-alpine AS builder
RUN go version

RUN apk add git

ADD . /app

WORKDIR /app

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-w" -a -o /go-cicd .

FROM alpine:latest

COPY --from=builder /go-cicd ./

RUN chmod +x ./go-cicd

EXPOSE 8080

ENTRYPOINT ["./go-cicd", "server"]
#CMD ./go-cicd server