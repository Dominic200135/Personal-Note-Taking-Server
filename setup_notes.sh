#!/bin/bash
set -e

# Variables
FLATNOTES_PORT=8080
DATA_DIR="$HOME/myproject/flatnotes-data"
USERNAME="user"
PASSWORD="password"
SECRET_KEY="aLongRandomSeriesOfCharacters"

sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER

# Create data directory
mkdir -p "$DATA_DIR"

# Run Flatnotes container
docker run -d \
  --name flatnotes \
  -p $FLATNOTES_PORT:8080 \
  -v "$DATA_DIR:/data" \
  -e PUID=1000 \
  -e PGID=1000 \
  -e FLATNOTES_AUTH_TYPE=password \
  -e FLATNOTES_USERNAME="$USERNAME" \
  -e FLATNOTES_PASSWORD="$PASSWORD" \
  -e FLATNOTES_SECRET_KEY="$SECRET_KEY" \
  dullage/flatnotes:latest

# Configure firewall
sudo ufw allow $FLATNOTES_PORT/tcp
sudo ufw allow ssh
sudo ufw --force enable
echo "Flatnotes running on http://localhost:$FLATNOTES_PORT"
