@echo off
ECHO Building Blus ...
RMDIR /s /q build
MKDIR build
glue.exe ./srlua.exe blus-main.lua build/blus.exe
robocopy ./src ./build/lua /E>nul

robocopy . ./build lua51.dll>nul

ECHO Done!