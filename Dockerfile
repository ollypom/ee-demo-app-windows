FROM microsoft/aspnet:4.7.2-windowsservercore-1803
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
LABEL MAINTAINER=olly

ARG GIT_VERSION="2.17.1"
ARG GIT_RELEASE_NUMBER="2"
ARG GIT_DOWNLOAD_SHA256="52e611a411cd58eaaab8218bb917cb4410b0c5733f234be6e581c6a9821b30ea"

RUN Write-Host "Downloading Git version: $($env:GIT_VERSION), release: $($env:GIT_RELEASE_NUMBER)"; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -OutFile git.zip -Uri "https://github.com/git-for-windows/git/releases/download/v$($env:GIT_VERSION).windows.$($env:GIT_RELEASE_NUMBER)/MinGit-$($env:GIT_VERSION).$($env:GIT_RELEASE_NUMBER)-64-bit.zip"

ARG site_root=app/.

ADD ${site_root} /inetpub/wwwroot
