#!/usr/bin/env bash

set -ex

cd src
# ignore zap/exp/zapslog (MIT) https://github.com/uber-go/zap/issues/1441
go-licenses \
    save . \
    --ignore go.uber.org/zap/exp/zapslog \
    --save_path ../library_licenses
cd ../xcaddy
(
    unset GOOS
    unset GOARCH
    go build -o xcaddy cmd/xcaddy/main.go
)

./xcaddy build "v$PKG_VERSION" --output "$PREFIX/bin/caddy"
# Clear out cache to avoid file not removable warnings
chmod -R u+w "$(go env GOPATH)" && rm -r "$(go env GOPATH)"
