#!/bin/bash

echo "Stopping Node.js servers using PM2..."

if pm2 list | grep -q "myapp"; then
    pm2 stop myapp
    pm2 delete myapp  # Ensures PM2 process is properly removed
    echo "Application 'myapp' stopped and removed."
else
    echo "No running application found in PM2."
fi
