#!/bin/bash

echo "Stopping Node.js servers using PM2..."

# Load NVM
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"    

PM2_EXEC=$(which pm2)

if $PM2_EXEC list | grep -q "myapp"; then
    $PM2_EXEC stop myapp
    $PM2_EXEC delete myapp
    echo "Application 'myapp' stopped and removed."
else
    echo "No running application found in PM2."
fi
