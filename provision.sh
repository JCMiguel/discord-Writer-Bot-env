#!/bin/bash

# This script is run as the final command on creation of the container, to setup everything we need to run the bot.
# Start MariaDB service.
service mysql start

# Create the bot database and a user we can use to access it.
mysql -e "CREATE DATABASE IF NOT EXISTS bot CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
mysql -e "CREATE USER IF NOT EXISTS 'dbuser'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON bot.* TO 'dbuser'@'localhost';";
mysql -e "FLUSH PRIVILEGES;"

# Install app requirements.
pip3 install -r /app/requirements.txt

# Move settings.json template into /app directory, as we can't COPY it in the Dockerfile or it gets overwritten by the volume.
# We do it this way, because the database name, user, etc... is defined in the template so you don't have to make your own changes.
mv /provision/templates/settings.json /app/settings.json

# Start the bot.
cd /app
echo "Starting Writer-Bot"
echo "==================="
python3.8 -u /app/run.py > /app/logs/bot.log 2> /app/logs/error.log