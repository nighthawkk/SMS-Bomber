@echo off
if "%~1"=="" (
    echo Usage: run.bat ^<phone_number^>
    exit /b
)

set phoneNumber=%~1
dotnet new console -n MyApp
cd MyApp
copy ..\sender.cs Program.cs
dotnet run phoneNumber
cd ..
rd /s /q MyApp
