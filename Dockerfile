FROM golang:latest

ENV APP_HOME /app
RUN mkdir -p "$APP_HOME"
ADD application/server.go /app
WORKDIR "$APP_HOME"
RUN go build server.go
CMD ["/app/server"]
