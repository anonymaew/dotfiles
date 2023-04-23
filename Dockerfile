FROM alpine:latest

# prereq programs
RUN apk update && apk add \
	wget curl git zsh tmux neovim nodejs

# create non-root user
RUN addgroup -S napatsc && adduser -S napatsc -G napatsc
USER napatsc
WORKDIR /home/napatsc

# copy all dotfiles environment
COPY --chown=napatsc . . 
