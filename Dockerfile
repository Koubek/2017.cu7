FROM navdocker.azurecr.io/dynamics-nav-generic

COPY NAVDVD /NAVDVD/

RUN PowerShell .\Run\buildimage.ps1

ENV DatabaseServer localhost
ENV DatabaseName CRONUS
