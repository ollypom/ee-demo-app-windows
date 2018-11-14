FROM microsoft/aspnet:4.7.2-windowsservercore-1803
LABEL MAINTAINER=olly

ARG site_root=app/.

ADD ${site_root} /inetpub/wwwroot
