@echo off
if "%~2"=="" (
    echo Usage: run.bat ^<phone_number^> ^<iteration_count^>
    exit /b
)

set phoneNumber=%~1
set iteration_count=%~2

javac Sender.java
java Sender %phoneNumber% %iteration_count%
del Sender.class
