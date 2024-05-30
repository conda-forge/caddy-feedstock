cd src
REM ignore zap/exp/zapslog (MIT) https://github.com/uber-go/zap/issues/1441
go-licenses ^
    save . ^
    --ignore go.uber.org/zap/exp/zapslog ^
    --save_path ../library_licenses
if %errorlevel% neq 0 exit /b %errorlevel%
cd ../xcaddy
go run .\cmd\xcaddy\main.go build v%PKG_VERSION% --output "%LIBRARY_BIN%\caddy.exe"
