#!/bin/bash
set -eu

##
# This script is designed to run as a container CMD to show the output of an
# apt-get update when the entire source file is reduced to our custom repo
##

# ensure there's only 2 lines in our sources.list file
echo "deb [arch=amd64] \"${DEBREPO}\" xenial main" > \
  /etc/apt/sources.list
echo "deb [arch=amd64] \"${DEBREPO}\" xenial custom" >> \
  /etc/apt/sources.list

# load the newly inserted sources
apt-get update

# some hits
apt search jq
apt search nginx

# a miss
apt search ruby

# run top forever so we can inspect this container if needs be
top -b > /dev/null
