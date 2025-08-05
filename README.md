Flatnotes Setup Script
Overview
This script automates the deployment of Flatnotes, a lightweight, self-hosted note-taking app that supports Markdown and password authentication. It uses Docker for containerization and UFW for basic firewall protection.

Features
Installs Docker if not already present

Creates a persistent data directory

Runs Flatnotes with password authentication

Configures UFW to allow SSH and Flatnotes traffic

Outputs the local access URL


 Usage
1. Make the script executable
bash
chmod +x setup_flatnotes.sh
2. Run the script
bash
./setup_flatnotes.sh
If Docker is not installed, the script will install it and prompt you to log out and back in to apply group changes.

Authentication & Security
Username: user

Password: password

Secret Key: Used for session encryption. Change this to a secure, random string.

You can modify these values in the script before running it.

Firewall Rules:

SSH access is allowed

Port 8080 is opened for Flatnotes

UFW is enabled and enforced

 Access
Once the script completes, Flatnotes will be available at:

http://localhost:8080
If deployed on a remote server, replace localhost with your server’s IP address.

 Cleanup
To stop and remove the container:

bash
docker stop flatnotes
docker rm flatnotes
To remove the data:

bash
rm -rf ~/myproject/flatnotes-data
