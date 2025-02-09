#!/bin/bash

# Ensure script runs with sudo privileges
sudo -v

# Install Node.js via NVM if not installed
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing NVM and Node.js..."
    
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    nvm install node
    nvm use node
else
    echo "Node.js is already installed."
fi

# Install PM2 globally with sudo access
if ! command -v pm2 &> /dev/null; then
    echo "PM2 not found. Installing PM2..."
    sudo npm install -g pm2
else
    echo "PM2 is already installed."
fi

# Ensure the app directory exists and has correct permissions
sudo mkdir -p /home/ubuntu/app
sudo chown -R ubuntu:ubuntu /home/ubuntu/app
sudo chmod -R 775 /home/ubuntu/app

# Make all scripts executable
if [ -d "/home/ubuntu/app/scripts" ]; then
    sudo chmod +x /home/ubuntu/app/scripts/*.sh
    echo "Scripts made executable."
fi

# Enable PM2 to start on boot
if ! systemctl is-enabled pm2-ubuntu &>/dev/null; then
    sudo pm2 startup systemd -u ubuntu --hp /home/ubuntu
    echo "PM2 startup configured."
else
    echo "PM2 startup already configured."
fi

echo "Setup complete."
