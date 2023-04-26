#!/bin/sh

# move all config files to home dir
rsync --exclude-from='.dockerignore' -avh . ~

# source it
source ~/.profile
