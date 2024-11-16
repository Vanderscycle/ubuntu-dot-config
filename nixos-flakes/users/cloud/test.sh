#!/usr/bin/env bash

# Create a temporary directory
temp=$(mktemp -d)

# Function to cleanup temporary directory on exit
cleanup() {
	rm -rf "$temp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$temp/etc/ssh"

# Decrypt your private key from the password store and copy it to the temporary directory
pass endeavourGit >"$temp/etc/ssh/endeavourGit"

# Set the correct permissions so sshd will accept the key
chmod 600 "$temp/etc/ssh/endeavourGit"

# Install NixOS to the host system with our secrets
nixos-anywhere --extra-files "$temp" --flake ".#homelab-0" cloud@192.168.1.107
