#!/bin/bash

sudo chmod -R 777 /home/ubuntu/app
cd /home/ubuntu/app

source ~/.bashrc  # Load NVM

echo "Starting Node.js server using PM2..."
pm2 start server.js --name myapp --watch || pm2 restart myapp
pm2 save

echo "Application started successfully."
