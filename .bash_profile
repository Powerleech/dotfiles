#!/bin/sh

### THIS IS A DUMMY FILE
### DON'T NEED TWO FILES TO DO ONE JOB
### LET'S CALL ~/.bashrc INSTEAD

# source ~/.bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
. "$HOME/.cargo/env"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

