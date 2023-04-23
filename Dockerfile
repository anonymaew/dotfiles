FROM ubuntu:22.04

# prereq programs
RUN apt-get clean && apt-get update && apt install -y \
	wget curl git zsh tmux neovim nodejs

# create non-root user
RUN groupadd -r napatsc && useradd -r -g napatsc napatsc
USER napatsc
WORKDIR /home/napatsc

# mountable volume at home dir
VOLUME ['/home/napatsc'] 
