#!/bin/bash

git clone git@github.com:napatsc/dotfiles.git
cd dotfiles

rsync --exclude '.git/' \
	--exclude '.gitmodules/' \
	--exclude 'README.md' \
	--exclude 'Dockerfile' \
	--exclude 'install.sh' \
	-avh . ~;

rm -rf ./
source ~/.bashrc;
