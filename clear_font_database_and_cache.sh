#!/usr/bin/env bash
##################################################
# Name: clear_font_database_and_cache.sh
# Description: Clear Font Database and Cache
# Script Maintainer: Danijel-James Wynyard
#
# Last Updated: May 2, 2016
##################################################

# Keep sudo alive
#
sudo echo "" # Asks for passwords
( while true; do sudo -v; sleep 40; done ) &
sudoPID=$!

# Clear the dyld Cache
#
sudo atsutil databases -remove

# Invalidate sudo
sudo -k