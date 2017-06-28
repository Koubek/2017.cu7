FROM navdocker.azurecr.io/dynamics-nav-generic

LABEL maintainer "Freddy Kristiansen"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY NAVDVD /NAVDVD/

ENV BuildingImage Y
RUN PowerShell c:\Run\navstart.ps1
ENV BuildingImage _

ENV DatabaseServer localhost
ENV DatabaseInstance Default
ENV DatabaseName CRONUS

CMD C:\Run\start.ps1
