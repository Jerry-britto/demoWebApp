#!/bin/bash

# Install NVM and Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install node
nvm use node

# Install PM2 globally
npm install -g pm2

mkdir -p /home/ubuntu/app

# Make all scripts executable
chmod +x /home/ubuntu/app/scripts/*.sh

# Setup PM2 to start on boot
pm2 startup systemd -u ubuntu --hp /home/ubuntu

echo "Setup complete."
