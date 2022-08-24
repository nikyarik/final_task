FROM golang:latest

ENV APP_HOME /app
ENV WEB_HOME /app/static
RUN mkdir -p "$APP_HOME"
RUN mkdir -p "$WEB_HOME"
ADD application/server.go /app
ADD application/static/index.html /app/static
WORKDIR "$APP_HOME"
RUN go build server.go
CMD ["/app/server"]
