@echo off
if "%~2"=="" (
    echo Usage: run.bat ^<phone_number^> ^<iteration_count^>
    exit /b
)

set phoneNumber=%~1
set iteration_count=%~2

go run sender.go %phoneNumber% %iteration_count%
