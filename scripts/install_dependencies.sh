#!/bin/bash

# Load NVM and Node.js
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo "Installing dependencies for Deployment..."

# Install project dependencies
cd /home/ubuntu/app
npm install --production

echo "Dependencies installed successfully!"
