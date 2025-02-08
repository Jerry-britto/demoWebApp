#!/bin/bash

echo "Stopping Node.js servers using PM2..."
if pgrep -x "node" > /dev/null; then
    pm2 stop all
    pm2 delete all  # Ensures all PM2 processes are properly removed
    echo "All Node.js servers stopped."
else
    echo "No running Node.js servers found."
fi
