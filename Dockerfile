FROM alpine:latest

# prereq programs
RUN apk add \
	bash curl git neovim nodejs rsync tmux wget zsh 

# create non-root user
RUN addgroup -S napatsc && adduser -S napatsc -G napatsc
USER napatsc
WORKDIR /home/napatsc

# copy all dotfiles environment
RUN mkdir dotfiles
COPY --chown=napatsc . dotfiles

# install
ENTRYPOINT ["./dotfiles/install.sh"]
