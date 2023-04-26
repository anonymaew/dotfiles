#!/bin/sh

# move all config files to home dir
rsync --exclude-from='.dockerignore' -avh . ~

# clone 
git clone git@github.com:romkatv/powerlevel10k.git .config/p10k
git clone https://github.com/tmux-plugins/tpm.git \
    .local/share/tmux/plugins/tpm

# source it
source ~/.profile
