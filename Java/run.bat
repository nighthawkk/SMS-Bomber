@echo off
if "%~1"=="" (
    echo Usage: run.bat ^<phone_number^>
    exit /b
)

set phoneNumber=%~1
javac Sender.java
java Sender %phoneNumber%
del Sender.class
