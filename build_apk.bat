@echo off
set "JAVA_HOME=C:\jdk17"
set "PATH=C:\jdk17\bin;C:\flutter\bin;%PATH%"
call flutter build apk --release
