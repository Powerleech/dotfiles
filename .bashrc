# ~/.bashrc
#
for file in ~/.{aliases,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
source ~/.aliases
source ~/.exports


# nvm
source /usr/share/bash-completion/completions/git
if [[ -d /usr/share/nvm/init-nvm.sh ]]; then source /usr/share/nvm/init-nvm.sh; fi
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


#starship
eval "$(starship init bash)"

# use vi bindings
set -o vi
