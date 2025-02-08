#!/bin/bash

source ~/.bashrc  # Load NVM

cd /home/ubuntu/app
echo "Installing dependencies for Deployment..."

rm -rf node_modules package-lock.json  # Ensures clean install
npm ci  # Ensures exact versions from package-lock.json
