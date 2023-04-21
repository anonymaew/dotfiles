#!/bin/bash

rsync --exclude '.git/' \
	--exclude '.gitmodules/' \
	--exclude 'README.md' \
	--exclude 'Dockerfile' \
	--exclude 'install.sh' \
	-avh . ~

source ~/.profile
