#!/bin/bash

# Updating and Installing Basic Dependencies
echo "Updating system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install MongoDB (Debian/Ubuntu)
echo "Installing MongoDB..."
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Navigate to the Project Directory
cd /Users/toddcurry/gpt-pilot/workspace/duckriver

# Initialize npm and Create package.json
echo "Initializing Node.js project..."
npm init -y

# Install Node.js Dependencies
echo "Installing Node.js dependencies..."
npm install express mongoose socket.io react bootstrap jsonwebtoken bcrypt cron axios

# Setting up React (This creates a 'client' folder in your project directory)
echo "Setting up React app..."
npx create-react-app client

echo "Dependencies installation complete!"

