#!/bin/bash
cd /var/www/html
nohup node server.js > app.log 2>&1 &
