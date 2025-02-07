#!/bin/bash
cd /home/ubuntu/app
nohup node server.js > app.log 2>&1 &
