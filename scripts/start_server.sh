#!/bin/bash

echo "starting node server"

sudo chmod -R 777 /home/ubuntu/app

cd /home/ubuntu/app

export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm	
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion (node is in path now)

npm install

node server.js > server.out.log 2> server.err.log < /dev/null & 

echo "server is running"