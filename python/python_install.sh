#!/bin/bash

# Update Apt
if ( apt-cache show python3 &> /dev/null )
then
  echo -e "\n\033[1;32m==== Go in cache ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Updating Apt ====\033[0m\n"
  sudo apt update 
fi

# Install Python3
if ( which python3 > /dev/null )
then 
  echo -e "\n\033[1;32m==== Python3 installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Python3 ====\033[0m\n"
  sudo apt install python3
fi

# Install Pip3
if ( which python3-pip > /dev/null )
then 
  echo -e "\n\033[1;32m==== Pip3 installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Pip3 ====\033[0m\n"
  sudo apt install -y python3-pip
fi

if ( pip show fire > /dev/null )
then 
  echo -e "\n\033[1;32m==== Fire installed ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Fire ====\033[0m\n"
  pip3 install fire
fi

# Install python3-venv package
if ( dpkg -s python3.10-venv > /dev/null )
then
  echo -e "\n\033[1;32m==== Python3 virtual environment package present ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Installing Python3 virtual environment package ====\033[0m\n"
  sudo apt install -y python3.10-venv
fi

# Set up a virtual environment
if [ -f py3env/bin/python ]
then
  echo -e "\n\033[1;32m==== Python3 virtual environment present ====\033[0m\n"
else
  echo -e "\n\033[1;33m==== Creating Python3 virtual environment ====\033[0m\n"
  python3 -m venv py3env
fi

# Activate virtual environment
source py3env/bin/activate