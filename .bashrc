export SHELL=`which zsh`
source ~/.config/env
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
