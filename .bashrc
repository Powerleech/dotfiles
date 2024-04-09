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

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# use vi bindings
set -o vi
. "$HOME/.cargo/env"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-nvchad="NVIM_APPNAME=NvChadNvim nvim"
alias nvim-lunar="NVIM_APPNAME=LunarNvim nvim"

nvims() {
  items=("default" "AstroNvim" "NvChadNvim" "LunarNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
echo "$config" > ~/.last_nvim_config
  NVIM_APPNAME=$config nvim $@
}

bind '\C-a':"nvims\n"
export PATH="$PATH:/opt/mssql-tools/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
