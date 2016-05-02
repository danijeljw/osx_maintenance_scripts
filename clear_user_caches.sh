#!/usr/bin/env bash
##################################################
# Name: clear_user_caches.sh
# Description: Clear caches for current user
# Script Maintainer: Danijel-James Wynyard
#
# Last Updated: May 2, 2016
##################################################

# Keep sudo alive
#
sudo echo "" # Asks for passwords
( while true; do sudo -v; sleep 40; done ) &
sudoPID=$!

# Clear the current user Caches folder
#
sudo rm -rf $HOME/Library/Caches/*

# Clear System Caches folder
#
#sudo rm -rf /Library/Caches

# Invalidate sudo
sudo -k
