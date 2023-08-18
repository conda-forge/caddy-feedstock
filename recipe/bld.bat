cd src
go-licenses save . --save_path ../library_licenses
if %errorlevel% neq 0 exit /b %errorlevel%
cd ../xcaddy
go run .\cmd\xcaddy\main.go build v%PKG_VERSION% --output "%LIBRARY_BIN%\caddy.exe"
