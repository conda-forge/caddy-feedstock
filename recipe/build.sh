#!/usr/bin/env bash

set -e

cd src
go-licenses save . --save_path ../library_licenses
cd ../xcaddy
(
    unset GOOS
    unset GOARCH
    go build -o xcaddy
)

./xcaddy build "v$PKG_VERSION" --output "$PREFIX/bin/caddy"
# Clear out cache to avoid file not removable warnings
chmod -R u+w "$(go env GOPATH)" && rm -r "$(go env GOPATH)"
