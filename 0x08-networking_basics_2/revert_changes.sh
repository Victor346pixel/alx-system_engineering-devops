#!/usr/bin/env bash
sudo cp /etc/hosts.bak /etc/hosts

# Restart the networking service to apply the changes
sudo systemctl restart networking

echo "Changes reverted successfully. The original /etc/hosts file:"
cat /etc/hosts

