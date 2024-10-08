@echo off
if "%~2"=="" (
    echo Usage: run.bat ^<phone_number^> ^<iteration_count^>
    exit /b
)

set phoneNumber=%~1
set iteration_count=%~2
dotnet new console -n MyApp
cd MyApp
copy ..\sender.cs Program.cs
dotnet run %phoneNumber% %iteration_count%
cd ..
rd /s /q MyApp
