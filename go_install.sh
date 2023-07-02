#!/bin/bash

# Set Go module name
MODNAME="github.com/Jason-Doze/meshellica"

# Update Apt
if ( apt-cache show go &> /dev/null )
then
  echo -e "\n\033[1;32m==== Go in cache ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Updating Apt ====\033[0m\n"
  sudo apt update 
fi

# Install Go
if ( which go > /dev/null )
then 
  echo -e "\n\033[1;32m==== Go installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Go ====\033[0m\n"
  sudo apt install -y golang
fi

# Check if GOPATH/bin is in PATH
if ( echo "$PATH" | grep -q "$(go env GOPATH)/bin" ) 
then
  echo -e "\n\033[1;32m==== GOPATH/bin is already in PATH ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Adding GOPATH/bin to PATH in .bashrc ====\033[0m\n"
  echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> ~/.bashrc
  source ~/.bashrc
fi

# Initialiaze Go module
if [ -f go.mod ] 
then
  echo -e "\n\033[1;32m==== Go module initialized ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Initializing Go module ====\033[0m\n"
  go mod init $MODNAME
fi

# Install Cobra library
if [ -f "$(go env GOPATH)/bin/cobra" ]
then 
  echo -e "\n\033[1;32m==== Cobra installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Cobra ====\033[0m\n"
  go get github.com/spf13/cobra
fi

# Install Cobra CLI
if (which cobra-cli > /dev/null)
then 
  echo -e "\n\033[1;32m==== Cobra CLI installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Cobra CLI ====\033[0m\n"
  go install github.com/spf13/cobra-cli@latest
fi

# Initialize Cobra
if [ -d cmd ] 
then
  echo -e "\n\033[1;32m==== Cobra initialized ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Initializing Cobra ====\033[0m\n"
  cobra-cli init
fi