#!/bin/bash

sudo chmod -R 777 /home/ubuntu/app
cd /home/ubuntu/app

source ~/.bashrc  # Load NVM

echo "Starting Node.js server using PM2..."
pm2 start server.js --name myapp --watch  # Starts app & auto-restarts on crash
pm2 save  # Saves PM2 state

echo "Application started successfully."
