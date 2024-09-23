@echo off
if "%~1"=="" (
    echo Usage: %~nx0 ^<phone_number^>
    exit /b 1
)

set phone_number=%1
set encoded_url="aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"
for /f "delims=" %%i in ('powershell -command "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%encoded_url%'))"') do set "decoded_url=%%i"
set url=%decoded_url%%phone_number%
curl %url%