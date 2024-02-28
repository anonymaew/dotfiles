#!/bin/sh

# move all config files to home dir
rsync --exclude 'Dockerfile' --exclude '*.sh' --exclude '*.md' --exclude '.git*' -a $(dirname "$0")/ ~

# source it
source ~/.config/zsh/.zshenv
