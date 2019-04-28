FROM golang:alpine

RUN apk add -U --no-cache \
  git \
  && rm -rf /var/cache/apk/*

# Godep for vendoring
RUN go get github.com/golang/dep/cmd/dep

# Recompile the standard library without CGO
RUN CGO_ENABLED=0 go install -a std

ENV APP_DIR $GOPATH/src/github.com/tawachan/wastes
WORKDIR ${APP_DIR}
COPY . $APP_DIR

# Setup
# Vender配下はコミットされているので、`dep ensure` はしない
RUN dep ensure

RUN CGO_ENABLED=0 go build -ldflags '-d -w -s' -o wastes
CMD ["./wastes"]