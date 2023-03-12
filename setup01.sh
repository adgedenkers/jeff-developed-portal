# setup01.sh
# author:  jeff
# created: 2023-03-12
# updated: 

#!/bin/bash

# Check if curl is installed, if not, install it
if ! command -v curl &> /dev/null; then
    echo "curl not found, installing..."
    sudo apt-get update
    sudo apt-get install curl -y
    echo "curl installed successfully."
fi

# Check if pip is installed, if not, install it
if ! command -v pip &> /dev/null; then
    echo "pip not found, installing..."
    sudo apt-get update
    sudo apt-get install python3-pip -y
    echo "pip installed successfully."
fi

# Check if Python 3 is installed, if not, install it
if ! command -v python3 &> /dev/null; then
    echo "Python 3 not found, installing..."
    sudo apt-get update
    sudo apt-get install python3 -y
    echo "Python 3 installed successfully."
fi

# Install required Python packages
echo "Installing Django, Django REST Framework, and Django JWT..."
pip install django djangorestframework djangorestframework-jwt
echo "Packages installed successfully."
