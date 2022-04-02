#!/bin/bash

# add dotnet repo
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# install dev-dependencies
sudo apt-get update; \
  sudo apt-get -y install dotnet-sdk-6.0 git cmake build-essential libcurl3 openssl1.0-dev pkg-config libboost-all-dev libsodium-dev libzmq5 autoconf 

(cd src/Miningcore && \
BUILDIR=${1:-../../build} && \
echo "Building into $BUILDIR" && \
dotnet publish -c Release --framework net6.0 -o $BUILDIR)
