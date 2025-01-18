#!/bin/bash

# Enable contrib and non-free apt repos
sed -i '/^Components:/ s/main/main contrib non-free/' "/etc/apt/sources.list.d/debian.sources"

# apt update and upgrade
apt update -y && apt upgrade -y

# Install essential stuff
apt install -y fish nano wget curl