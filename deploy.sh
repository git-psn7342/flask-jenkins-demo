#!/bin/bash

# Pull latest code
cd /home/ubuntu/flask-jenkins-demo || exit
git pull origin main

# Install dependencies
pip3 install -r requirements.txt

# Restart service (using nohup for simplicity)
pkill -f app.py
nohup python3 app.py > app.log 2>&1 &

chmod +x deploy.sh
