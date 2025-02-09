#!/bin/bash

cd /home/ubuntu/app

# Load NVM
source ~/.bashrc

echo "Starting Node.js server using PM2..."
pm2 start server.js --name myapp --watch || pm2 restart myapp
pm2 save

echo "Application started successfully."
