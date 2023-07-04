#!/bin/bash

# Update Apt
# if ( apt-cache show golang &> /dev/null )
# then
#   echo -e "\n\033[1;32m==== Go in cache ====\033[0m\n"
# else
#   echo -e "\n\033[1;33m==== Updating Apt ====\033[0m\n"
  sudo apt update # && apt upgrade -y
# fi

# Install Go
if ( which go > /dev/null )
then 
  echo -e "\n\033[1;32m==== Go installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Go ====\033[0m\n"
  sudo apt install -y golang
fi

# Add GOPATH/bin to $PATH
if ( echo "$PATH" | grep -q "$(go env GOPATH)/bin" ) 
then
  echo -e "\n\033[1;32m==== GOPATH/bin is already in PATH ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Adding GOPATH/bin to PATH in .bashrc ====\033[0m\n"
  echo "export PATH=\$PATH:$(go env GOPATH)/bin" >> ~/.bashrc
  export PATH=$PATH:$(go env GOPATH)/bin
fi

# Install Cobra
if ( which cobra > /dev/null )
then 
  echo -e "\n\033[1;32m==== Cobra installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Cobra ====\033[0m\n"
  sudo apt install cobra
fi

# Install Cobra CLI
if (which cobra-cli > /dev/null)
then 
  echo -e "\n\033[1;32m==== Cobra CLI installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Cobra CLI ====\033[0m\n"
  go install github.com/spf13/cobra-cli@latest
fi

# # Create Module directory
# if [ -d /home/jasondoze/meshellica/gomod ]
# then
#   echo -e "\n\033[1;32m==== Gomod directory present ====\033[0m\n"
# else
#   echo -e "\n\033[1;33m==== Creating Gomod directory ====\033[0m\n"
#   mkdir gomod
# fi

# Initialiaze Go module
if [ -f /home/jasondoze/meshellica/go.mod ] 
then
  echo -e "\n\033[1;32m==== Go module initialized ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Initializing Go module ====\033[0m\n"
  # pushd gomod
  go mod init modulos
fi

# Initialize Cobra CLI app
if [ -f /home/jasondoze/meshellica/gomod/main.go ] 
then
  echo -e "\n\033[1;32m==== Cobra initialized ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Initializing Cobra ====\033[0m\n"
  cobra init
fi

go run main.go