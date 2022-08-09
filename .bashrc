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

#starship
eval "$(starship init bash)"

# use vi bindings
set -o vi
