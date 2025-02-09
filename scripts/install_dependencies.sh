#!/bin/bash

echo "Loading NVM..."
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo "Installing dependencies for Deployment..."

# Ensure correct ownership
sudo chown -R ubuntu:ubuntu /home/ubuntu/app

cd /home/ubuntu/app || exit 1

# Use --legacy-peer-deps in case of dependency conflicts
npm install --production --legacy-peer-deps

echo "Dependencies installed successfully!"
