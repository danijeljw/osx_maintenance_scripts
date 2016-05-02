#!/usr/bin/env bash
##################################################
# Name: clear_dyld_cache.sh
# Description: Clear the dyld Cache
# Script Maintainer: Danijel-James Wynyard
# License: MIT (c) Danijel-James Wynyard 2016
# Last Updated: May 2, 2016
##################################################

# Keep sudo alive
#
sudo echo "" # Asks for passwords
( while true; do sudo -v; sleep 40; done ) &
sudoPID=$!

# Clear the dyld Cache
#
sudo update_dyld_shared_cache -force

# Invalidate sudo
sudo -k
